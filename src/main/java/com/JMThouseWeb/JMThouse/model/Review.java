package com.JMThouseWeb.JMThouse.model;

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
	private House houseId;

	@ManyToOne
	@JoinColumn(name = "guestId")
	private User guestId;

	@Lob
	private String content;

	@ColumnDefault("0.0")
	private double starScore;

	@OneToMany(mappedBy = "reviewId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	private List<Reply> replies;

}
