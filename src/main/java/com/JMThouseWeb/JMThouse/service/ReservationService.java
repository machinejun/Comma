package com.JMThouseWeb.JMThouse.service;

import java.sql.Date;
import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.JMThouseWeb.JMThouse.model.BookedDate;
import com.JMThouseWeb.JMThouse.model.House;
import com.JMThouseWeb.JMThouse.model.Reservation;
import com.JMThouseWeb.JMThouse.repository.BookedDateRepository;
import com.JMThouseWeb.JMThouse.repository.HouseRepository;
import com.JMThouseWeb.JMThouse.repository.ReservationRepository;



@Service
public class ReservationService {
	
	//User레파지 스토리도 필요하다
	
	@Autowired
	private BookedDateRepository bookedDateRepository;
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private HouseRepository houseRepository;

	public void makeReservation(Reservation reservation) {
		int[] tempIdList = reservation.getTempIdBox();
		House house = houseRepository.findById(tempIdList[2]).orElseThrow(() ->{
			return new RuntimeException("해당 숙소를 찾을수 없습니다.");
		});
		// user, host 찾아야함
		reservation.setHouseId(house);
		//reservation.setGuestId(null);
		reservation.setHostId(house.getHostId());


		calculateBookedDates(reservation.getCheckInDate(), reservation.getCheckOutDate(),house);
		
		
	}
	
	private void calculateBookedDates(Date checkinDate, Date checkOutDate, House house) {
		int range = getRangeDay(checkinDate, checkOutDate);
		BookedDate bookedDate = new BookedDate();
		bookedDate.setHouse(house);
		if(range == 1) {
			bookedDate.setBookedDate(new java.sql.Date(checkinDate.getTime()).toLocalDate());
			bookedDateRepository.save(bookedDate);
			bookedDate.setBookedDate(new java.sql.Date(checkOutDate.getTime()).toLocalDate());
			bookedDateRepository.save(bookedDate);
		}else {
			bookedDate.setBookedDate(new java.sql.Date(checkinDate.getTime()).toLocalDate());
			bookedDateRepository.save(bookedDate);
			for(int i = 1; i < range; i++) {
				bookedDate.setBookedDate(new java.sql.Date(checkinDate.getTime()).toLocalDate().plusDays(i));
				bookedDateRepository.save(bookedDate);
			}
			bookedDate.setBookedDate(new java.sql.Date(checkOutDate.getTime()).toLocalDate());
			bookedDateRepository.save(bookedDate);
		}
	}
	
	
	
	private int getRangeDay(Date checkinDate, Date checkOutDate) {
		long sec = (checkOutDate.getTime() - checkinDate.getTime())/1000;
		int result = (int)sec/(24*60*60);
		System.out.println(result);
		return result;
	}
}
