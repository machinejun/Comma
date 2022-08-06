package com.CommaWeb.Comma.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Admin implements Serializable {

	@Id
	@Column(name = "userId")
	private int userId;

	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "userId")
	private User user;

}
