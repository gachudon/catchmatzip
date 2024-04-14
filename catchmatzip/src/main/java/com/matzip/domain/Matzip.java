package com.matzip.domain;

import lombok.Data;

@Data
public class Matzip {
	private Integer matzipId;
	private String matzipName;
	private String district;
	private String city;
	private String detailAddress;
	private Double averageScore;
	private String category;
	private String image;
}
