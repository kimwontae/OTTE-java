package org.zerock.domain;

import java.util.Date;

import lombok.Data;

public @Data class FollowVO {

	private Integer contentsid;
	private Date wishdate;
	private Integer usernum;
	private Integer count;
	
}
