package org.zerock.domain;

import java.util.Date;

import lombok.Data;

public @Data class ContentsVO {
	
	//	컨텐츠관련데이터
	private Integer contentsid;
	private String nationname;
	private String ottname;
	private String gradename;
	private String classname;
	private String contentstitle;
	private String contentssummary;
	private Date contentsstart;
	private Integer contentsseason;
	private Integer contentsepisode;
	private Integer contentsscore;
	private Integer contentsduration;
	private String imgname;
	private String movieimgfile;
	
	//	찜관련데이터
	private Date wishdate;
	private Integer usernum;
	
	//	리뷰관련데이터
	private Integer reviewid;
	private Integer reviewscore;
	private String reviewnatter;
	private Date reviewdate;
	private String userid;
	private Float avgScore;
	private Integer reviewcnt;
	private Integer halfstar;
	
}
