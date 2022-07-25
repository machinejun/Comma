package com.CommaWeb.Comma.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.CommaWeb.Comma.dto.ApproveDto;
import com.CommaWeb.Comma.dto.HostTableDto;
import com.CommaWeb.Comma.dto.HouseWaitDto;
import com.CommaWeb.Comma.model.BookedDate;
import com.CommaWeb.Comma.model.Guest;
import com.CommaWeb.Comma.model.Host;
import com.CommaWeb.Comma.model.House;
import com.CommaWeb.Comma.model.Reservation;
import com.CommaWeb.Comma.model.ReservationType;
import com.CommaWeb.Comma.model.RoleType;
import com.CommaWeb.Comma.model.User;
import com.CommaWeb.Comma.repository.BookedDateRepository;
import com.CommaWeb.Comma.repository.GuestRepository;
import com.CommaWeb.Comma.repository.HostRepository;
import com.CommaWeb.Comma.repository.HostTableRepository;
import com.CommaWeb.Comma.repository.HouseRepository;
import com.CommaWeb.Comma.repository.ReservationRepository;

@Service
public class ReservationService {
	public static String tid;
	
	@Autowired
	private HostTableRepository hostTableRepository;

	// User레파지 스토리도 필요하다
	@Autowired
	private GuestRepository guestRepository;

	@Autowired
	private HostRepository hostRepository;

	@Autowired
	private BookedDateRepository bookedDateRepository;

	@Autowired
	private ReservationRepository reservationRepository;

	@Autowired
	private HouseRepository houseRepository;

	@Transactional
	public void makeReservation(Reservation reservation) {
		int[] tempIdList = reservation.getTempIdBox();
		House house = houseRepository.findById(tempIdList[2]).orElseThrow(() -> {
			return new RuntimeException("해당 숙소를 찾을 수 없습니다.");
		});
		Guest guest = guestRepository.findById(tempIdList[0]).orElseThrow(() -> {
			return new RuntimeException("해당 게스트를 찾을 수 없습니다.");
		});
		Host host = hostRepository.findById(tempIdList[1]).orElseThrow(() -> {
			return new RuntimeException("해당 호스트를 찾을 수 없습니다.");
		});
		reservation.setPrice(house.getOneDayPrice() * getRangeDay(reservation.getCheckInDate(), reservation.getCheckOutDate()));
		reservation.setHouseId(house);
		reservation.setGuestId(guest);
		reservation.setHostId(host);
		calculateBookedDates(reservation.getCheckInDate(), reservation.getCheckOutDate(), reservation);
		reservation.setApprovalStatus(ReservationType.WAITING);
		reservationRepository.save(reservation);
	}

	private void calculateBookedDates(Date checkinDate, Date checkOutDate, Reservation res) {
		int range = getRangeDay(checkinDate, checkOutDate);

		for (int i = 0; i < range; i++) {
			BookedDate bookedDate = new BookedDate();
			bookedDate.setReservation(res);
			bookedDate.setBookedDate(changeToLocalDate(checkinDate).plusDays(i));
			bookedDateRepository.save(bookedDate);
		}

	}

	private LocalDate changeToLocalDate(Date date) {
		return new java.sql.Date(date.getTime()).toLocalDate();
	}

	public int getRangeDay(Date checkinDate, Date checkOutDate) {
		long sec = (checkOutDate.getTime() - checkinDate.getTime()) / 1000;
		int result = (int) sec / (24 * 60 * 60);
		return result;
	}
	
	@Modifying
	@Transactional(readOnly = true)
	public List<Reservation> getReservation(User user) {
		List<Reservation> reservation;
		reservation = reservationRepository.findByGuestId(user.getId());	
		changeCompletedType(reservation);
		return reservation;
	}

	private void changeCompletedType(List<Reservation> listRes) {
		System.out.println("실행됨");
		LocalDate nowtime = LocalDate.now();
		Date nowDate = Date.valueOf(nowtime);
		
		for (Reservation reservation : listRes) {
			if(reservation.getApprovalStatus() != ReservationType.PAID) {
				return;
			}
			
			if(getRangeDay(reservation.getCheckOutDate(), nowDate) > 0 ) {
				reservation.setApprovalStatus(ReservationType.COMPLETED);
			}
		}
	}
	
	@Modifying
	@Transactional
	public List<HostTableDto> getTableInfo(int hostId, int houseId, int month) {
		List<Reservation> reservation = reservationRepository.findByHostId(hostId);
		changeCompletedType(reservation);
		return hostTableRepository.getlist(hostId, houseId, month);
	}
	
	@Modifying
	@Transactional
	public List<HostTableDto> getTableInfo(int hostId, int month) {
		List<Reservation> reservation = reservationRepository.findByHostId(hostId);
		changeCompletedType(reservation);
		return hostTableRepository.getlist(hostId, month);
	}

	@Transactional(readOnly = true)
	public List<BookedDate> getListBookedDate(int houseid) {
		List<BookedDate> list = bookedDateRepository.findAllByHouseId(houseid);
		return list;
	}

	@Transactional(readOnly = true)
	public List<HouseWaitDto> getWaitCount(int hostid) {
		return hostTableRepository.getWaitCount(hostid);
	}

	@Transactional
	public void cancelReservation(int id) {
		bookedDateRepository.deleteAllByResId(id);
		reservationRepository.deleteById(id);
	}

	@Modifying
	@Transactional
	public void changeResType(ApproveDto approveDto) {
		Reservation reservation = findByResId(approveDto.getResId());
		reservation.setApprovalStatus(parseResEnumType(approveDto.getApprove()));
	}

	private ReservationType parseResEnumType(String type) {
		ReservationType enumType = ReservationType.WAITING;
		switch (type) {
		case "WAITING":
			enumType = ReservationType.WAITING;
			break;
		case "PAID":
			enumType = ReservationType.PAID;
			break;
		case "APPROVED":
			enumType = ReservationType.APPROVED;
			break;
		case "COMPLETED":
			enumType = ReservationType.COMPLETED;
		}
		return enumType;
	}

	public Reservation findByResId(int resId) {
		Reservation res = reservationRepository.findById(resId).orElseThrow(()->{
			return new RuntimeException("해당 예약을 찾을 수 없습니다.");
		});
		return res;
		
	}
	@Modifying
	@Transactional
	public boolean kakaoPaymentApprove(int resId) {
		Reservation res = reservationRepository.findById(resId).get();
		if(res == null) {
			return false;
		}
		res.setApprovalStatus(ReservationType.PAID);
		return true;
	}


}