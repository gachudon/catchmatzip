package com.matzip.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MatzipUser {
	private String userId;
	private String pwd;
	private String userName;
	private String phoneNumber;
	private String nickname;
	private Integer addressId;
	private Integer userCategory;
	private Date regDate;
}
