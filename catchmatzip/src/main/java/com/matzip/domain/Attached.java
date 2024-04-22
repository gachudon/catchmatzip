package com.matzip.domain;

import lombok.Data;

@Data
public class Attached {
	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean fileType; //이미지파일여부
	private Integer bno;

}