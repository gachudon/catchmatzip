package com.matzip.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class Review {
	private Integer reviewId;
	private Integer matzipId;
	private String userId;
	private Double score;
	private String reviewComment;
	private Date writtenTime;
	private String image;
	private String nickname;
}
