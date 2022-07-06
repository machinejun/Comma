package com.JMThouseWeb.JMThouse.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

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
	
	@OneToMany(mappedBy = "guestId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"guestId"})
	private List<Reservation> reservations;

}
