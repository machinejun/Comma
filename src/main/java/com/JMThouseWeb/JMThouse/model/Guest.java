package com.JMThouseWeb.JMThouse.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Guest implements Serializable{
	/*
	 * org.springframework.beans.factory.BeanCreationException: 
	 * Error creating bean with name 'entityManagerFactory' defined in class path resource [org/springframework/boot/autoconfigure/orm/jpa/HibernateJpaConfiguration.class]:
	 * Invocation of init method failed; nested exception is javax.persistence.PersistenceException: [PersistenceUnit: default] Unable to build Hibernate SessionFactory;
	 * nested exception is org.hibernate.MappingException:
	 * Composite-id class must implement Serializable: com.JMThouseWeb.JMThouse.model.Guest
	 */
	@Id
	@Column(name="userId")
	private int userId;

	@OneToOne
	@JoinColumn(name="userId")
	private User user;
	
	@OneToMany(mappedBy = "guestId", fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JsonIgnoreProperties({"guestId"})
	private List<Reservation> reservations;

}
