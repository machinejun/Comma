package com.JMThouseWeb.JMThouse.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class LikeHouse {

	@OneToOne
	@JoinColumn(name="guestId")
	private Guest guest;
	
	@JoinColumn(name="houseId")
	private House house;
}
