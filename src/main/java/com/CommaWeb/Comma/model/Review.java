package com.CommaWeb.Comma.model;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;

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
public class Review {

	/**
	 * 
	 * 게스트가 올리는 숙소 리뷰
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "houseId")
	@JsonIgnoreProperties({ "reviews" })
	private House houseId;

	@ManyToOne(cascade = CascadeType.REMOVE)
	@JoinColumn(name = "guestId")
	private User guestId;

	@Lob
	private String content;

	@ColumnDefault("0.0")
	private double starScore;

	@CreationTimestamp
	private Timestamp creationDate;

	@OneToMany(mappedBy = "reviewId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({ "reviewId" })
	@OrderBy("id DESC")
	private List<Reply> replies;

}
