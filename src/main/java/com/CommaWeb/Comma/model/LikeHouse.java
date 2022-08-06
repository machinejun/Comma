package com.CommaWeb.Comma.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import lombok.Data;

@Entity
@Data
@IdClass(LikeId.class)
public class LikeHouse implements Serializable {


	@Id
	@Column(name="house")
	private int houseId;

	@Id
	@Column(name="guest")
	private int guestId;
	
	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name="guestId", referencedColumnName = "id")
	private User guest;
	
	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name="houseId", referencedColumnName = "id")
	private House house;
}
