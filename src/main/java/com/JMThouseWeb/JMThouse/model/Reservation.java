package com.JMThouseWeb.JMThouse.model;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Reservation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "guestId")
	private Guest guestId;
	
	@ManyToOne
	@JoinColumn(name = "hostId")
	private Host hostId;
	
	@ManyToOne
	@JoinColumn(name = "houseId")
	private House houseId;

	@Column(nullable = false)
	private Date checkInDate;
	
	@Column(nullable = false)
	private Date checkOutDate;
	
	@Enumerated(EnumType.STRING)
	private ReservationType approvalStatus; // 예약 승인 상태
	
	@Transient
	private int[] tempIdBox = new int[3];
}
