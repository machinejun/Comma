package com.CommaWeb.Comma.model;

import java.sql.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OrderBy;
import javax.persistence.Transient;

import org.hibernate.annotations.ColumnDefault;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
	@OrderBy(value = "desc")
	private int id;

	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "guestId")
	@JsonIgnoreProperties({"reservations"})
	private User guestId;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "hostId")
	@JsonIgnoreProperties({"reservations"})
	private User hostId;
	
	@ManyToOne
	@JoinColumn(name = "houseId")
	@JsonIgnoreProperties({"reservations","hostId"})
	private House houseId;

	@Column(nullable = false)
	private Date checkInDate;
	
	@Column(nullable = false)
	private Date checkOutDate;
	
	@ColumnDefault("1")
	private int headCount;
	
	@ColumnDefault("0")
	private int price;
	
	private String request;
	
	@Enumerated(EnumType.STRING)
	private ReservationType approvalStatus; // 예약 승인 상태
	
	@Transient
	private int[] tempIdBox = new int[3]; // userid, hostid, houseid
}
