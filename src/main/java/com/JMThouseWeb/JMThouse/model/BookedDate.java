package com.JMThouseWeb.JMThouse.model;





import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Entity
public class BookedDate {
	@Id
	int id;
	
	@ManyToOne
	@JoinColumn(name = "houseId")
	private House house;
	
	@Temporal(TemporalType.DATE)
	private Date bookedDate;
}
