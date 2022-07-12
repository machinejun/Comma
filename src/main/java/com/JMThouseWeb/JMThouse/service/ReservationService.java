package com.JMThouseWeb.JMThouse.service;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.JMThouseWeb.JMThouse.model.BookedDate;
import com.JMThouseWeb.JMThouse.model.Guest;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Reservation;
import com.JMThouseWeb.JMThouse.model.ReservationType;
import com.JMThouseWeb.JMThouse.model.RoleType;
import com.JMThouseWeb.JMThouse.model.User;
import com.JMThouseWeb.JMThouse.repository.BookedDateRepository;
import com.JMThouseWeb.JMThouse.repository.GuestRepository;
import com.JMThouseWeb.JMThouse.repository.HostRepository;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;
import com.JMThouseWeb.JMThouse.repository.ReservationRepository;




@Service
public class ReservationService<T extends User>{
	
	
	//User레파지 스토리도 필요하다
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
		House house = houseRepository.findById(tempIdList[2]).orElseThrow(() ->{
			return new RuntimeException("해당 숙소를 찾을 수 없습니다.");
		});
		Guest guest = guestRepository.findById(tempIdList[1]).orElseThrow(() -> {
			return new RuntimeException("해당 게스트를 찾을 수 없습니다.");
		});
		
		reservation.setHouseId(house);
		reservation.setGuestId(guest);
		//reservation.setHostId(house.getHostId());
		calculateBookedDates(reservation.getCheckInDate(), reservation.getCheckOutDate(),house);
		reservation.setApprovalStatus(ReservationType.WAITING);
		reservationRepository.save(reservation);
	}
	
	private void calculateBookedDates(Date checkinDate, Date checkOutDate, House house) {
		int range = getRangeDay(checkinDate, checkOutDate);
		BookedDate bookedDate = new BookedDate();
		bookedDate.setHouse(house);
		bookedDate.setBookedDate(changeToLocalDate(checkinDate));
		bookedDateRepository.save(bookedDate);
		if(range != 1) {
			for(int i = 1; i < range; i++) {
				bookedDate.setBookedDate(changeToLocalDate(checkinDate).plusDays(i));
				bookedDateRepository.save(bookedDate);
			}
		}
	}
	
	private LocalDate changeToLocalDate(Date date) {
		return new java.sql.Date(date.getTime()).toLocalDate();
	}
	
	private int getRangeDay(Date checkinDate, Date checkOutDate) {
		long sec = (checkOutDate.getTime() - checkinDate.getTime())/1000;
		int result = (int)sec/(24*60*60);
		System.out.println(result);
		return result;
	}
	
	@Transactional(readOnly = true)
	public Reservation getReservation(User user) {
		Reservation reservation;
		if(user.getRole() == RoleType.GUEST) {
			reservation = reservationRepository.findByGuestId(user.getId()).orElseThrow(() -> {
				return new RuntimeException("해당 게스트는 예약을 하지않았습니다."); 
			});
		}else {
			reservation = reservationRepository.findByHostId(user.getId()).orElseThrow(() -> {
				return new RuntimeException("해당 호스트는 어떠한 예약도 없습니다."); 
			});
		}
		return reservation;
	}
}
