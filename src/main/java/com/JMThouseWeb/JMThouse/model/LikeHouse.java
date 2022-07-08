package com.JMThouseWeb.JMThouse.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
@IdClass(LikeId.class)
public class LikeHouse implements Serializable {
	
	@Id
	@Column(name="house")
	private int houseId;

	@Id
	@Column(name="guest")
	private int guestId;
	
	@Id
	@OneToOne
	@JoinColumn(name="guestId", referencedColumnName = "id")
	private User guest;
	
	@Id
	@ManyToOne
	@JoinColumn(name="houseId", referencedColumnName = "id")
	private House house;
}
