package com.matzip.domain;

import lombok.Data;

@Data
public class ModReview {
	private Integer reviewId;
	private Double score;
	private String reviewComment;
}
