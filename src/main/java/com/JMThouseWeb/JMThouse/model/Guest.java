package com.JMThouseWeb.JMThouse.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Guest {
	
	@Id
	@OneToOne
	@JoinColumn(name="userId")
	private User user;
	
	@OneToOne
	@JoinColumn(name="houseId")
	private LikeHouse likeHouse; // 찜 목록
	
	@OneToMany(mappedBy = "guestId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"guestId"})
	private List<Reservation> reservations;

}
