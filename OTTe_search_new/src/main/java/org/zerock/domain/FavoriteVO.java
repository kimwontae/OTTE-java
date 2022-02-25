package org.zerock.domain;

public class FavoriteVO {
	private Integer usernum;
	private String favoritesubject;
	private String favoritevalue;
	@Override
	public String toString() {
		return "FavoriteVO [usernum=" + usernum + ", favoritesubject=" + favoritesubject + ", favoritevalue="
				+ favoritevalue + "]";
	}
	public Integer getUsernum() {
		return usernum;
	}
	public void setUsernum(Integer usernum) {
		this.usernum = usernum;
	}
	public String getFavoritesubject() {
		return favoritesubject;
	}
	public void setFavoritesubject(String favoritesubject) {
		this.favoritesubject = favoritesubject;
	}
	public String getFavoritevalue() {
		return favoritevalue;
	}
	public void setFavoritevalue(String favoritevalue) {
		this.favoritevalue = favoritevalue;
	}
	
}
