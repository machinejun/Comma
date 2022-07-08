package com.JMThouseWeb.JMThouse.model;

import java.io.Serializable;

import lombok.EqualsAndHashCode;

@EqualsAndHashCode
public class LikeId implements Serializable{

	private int houseId;
	private int guestId;
}
