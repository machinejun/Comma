package com.CommaWeb.Comma.model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;

import org.hibernate.annotations.CreationTimestamp;

import lombok.Data;

@Entity
@Data
public class Report {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "reporter")
	private User reporter; // 신고자

	@ManyToOne
	@JoinColumn(name = "respondent")
	private User respondent; // 피신고자

	@Column(nullable = false)
	private String reportType; // 신고 유형

	@Lob
	private String detailText;

	@ManyToOne
	@JoinColumn(name = "reviewId")
	private Review reviewId;

	@ManyToOne
	@JoinColumn(name = "replyId")
	private Reply replyId;

	@CreationTimestamp
	private Timestamp creationDate;

	@Enumerated(EnumType.STRING)
	private ReportType reportStatus; // 신고 승인 여부

}
