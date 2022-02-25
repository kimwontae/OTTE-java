package org.zerock.domain;

import lombok.Data;

@Data
public class UserVO {

	private String useremail;
	private String userpassword;
	private String userid;
	private Integer usernum;
	private String fromMail;
	private String title;
	private String content;
	private String temp;
	private Integer admin;
	private String repassword;
	
}