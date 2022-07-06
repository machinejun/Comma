package com.JMThouseWeb.JMThouse.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Review implements Serializable {
	
	/**
	 * 
	 * 게스트가 올리는 숙소 리뷰
	 */
	
	@Id
	@ManyToOne
	@JoinColumn(name = "houseId")
	private House house;
	
	@Column(nullable = false, length = 100)
	private String title;
	
	@OneToOne
	@JoinColumn(name = "imageId")
	private Image image;
	
	@Lob
	private String content;
	
	private double starScore;
	
	@OneToMany(mappedBy = "review", fetch = FetchType.EAGER, cascade = CascadeType.REMOVE)
	private List<Reply> replies;
	
}
