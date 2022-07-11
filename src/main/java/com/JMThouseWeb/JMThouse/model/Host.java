package com.JMThouseWeb.JMThouse.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
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
public class Host implements Serializable{
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="userId")
	private User user;

	@OneToMany(mappedBy = "hostId", fetch = FetchType.LAZY)
	@JsonIgnoreProperties({"hostId"})
	private List<House> houses;
	
	@OneToMany(mappedBy = "hostId", fetch = FetchType.LAZY)
	@JsonIgnoreProperties({"hostId"})
	private List<Reservation> reservations;
}
