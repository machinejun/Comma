package com.CommaWeb.Comma.model;

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

import org.hibernate.annotations.Cascade;
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

	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "hostId")
	private User hostId;

	@ColumnDefault("0.0")
	private double starScore;

	private int oneDayPrice; // 하루 숙박 가격

	@Column(nullable = false)
	private String type; // 숙소 유형

	@OneToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "imageId")
	private Image image;

	@ColumnDefault("1")
	private int capacity;

	@Lob
	private String infoText;

	@CreationTimestamp
	private Timestamp creationDate;

	@OneToMany(mappedBy = "houseId", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({ "houseId" })
	private List<Review> reviews;

	@Override
	public String toString() {
		return "House [id=" + id + ", name=" + name + ", address=" + address + ", starScore=" + starScore
				+ ", oneDayPrice=" + oneDayPrice + ", type=" + type + ", image=" + image + ", capacity=" + capacity
				+ ", infoText=" + infoText + ", creationDate=" + creationDate + "]";
	}

}
