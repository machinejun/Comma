package com.JMThouseWeb.JMThouse.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import lombok.Data;

@Data
@Entity
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToMany
	@JoinColumn(name="userId")
	private Guest guestId;
	
	@ManyToOne
	@JoinColumn(name = "houseId")
	private House houseId;

	private Date checkInDate;
	
	private Date checkOutDate;
	
	@Enumerated(EnumType.STRING)
	private ReservationType approvalStatus; // 예약 승인 상태
}
