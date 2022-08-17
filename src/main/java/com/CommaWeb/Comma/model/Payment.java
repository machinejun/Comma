package com.CommaWeb.Comma.model;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
@Entity
public class Payment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(unique = true, nullable = false)
	private String aid;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "userId")
	private User user;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "houseId")
	private House house;
	
	@Column(nullable = false)
	private String paymentMethod;
	
	@Column(nullable = false)
	private int total;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private String approveAt;
	
	

}
