package com.matzip.domain;

import lombok.Data;

@Data
public class MatzipModify {
	private Integer matzipId;
	private String matzipName;
	private Integer addressId;
	private String detailAddress;
	private String category;
}
