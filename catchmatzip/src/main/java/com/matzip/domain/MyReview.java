package com.matzip.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MyReview {
	private String matzipName;
	private String userId;
	private double score;
	private String reviewComment;
	private Date writtenTime;
	private String image;
}
