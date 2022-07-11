package com.JMThouseWeb.JMThouse.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class House {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(nullable = false, length = 100)
	private String name;
	
	@Column(nullable = false)
	private String address;
	
	@ManyToOne
	@JoinColumn(name="hostId")
	private User hostId;
	
	@ColumnDefault("0.0")
	private double starScore;
	
	private int oneDayPrice; // 하루 숙박 가격
	
	@Column(nullable = false)
	private String type; // 숙소 유형
	
	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "imageId")
	private Image image;
	
	@Lob
	private String infoText;
	
	@CreationTimestamp
	private Timestamp creationDate;
	
	@OneToMany(mappedBy = "houseId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"houseId"})
	private List<Reservation> reservations;
	
	@OneToMany(mappedBy = "houseId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"houseId"})
	private List<Review> reviews;
	
	@OneToMany(mappedBy ="house", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	@JsonIgnoreProperties({"house"})
	private List<BookedDate> bookedDates;

}
