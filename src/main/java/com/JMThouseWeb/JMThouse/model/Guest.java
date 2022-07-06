package com.JMThouseWeb.JMThouse.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Guest extends User {
	
	@Transient // 해당 변수는 매핑하지 않음
	private List<House> likes; // 찜 목록
	
	@Transient
	private List<Reservation> reservations;

}
