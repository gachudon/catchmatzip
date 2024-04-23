package com.matzip.domain;

import lombok.Data;

@Data
public class PutReview {
	//2. 리뷰 등록 시 필요한 정보 : matzipId, userId, reviewComment, image
	private Integer matzipId;
	private String userId;
	private Double score;
	private String reviewComment;
}
