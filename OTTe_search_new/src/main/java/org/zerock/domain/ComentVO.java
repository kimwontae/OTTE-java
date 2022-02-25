package org.zerock.domain;

import java.util.Date;

public class ComentVO {

	private Integer comemntnum;
	private Integer comemnttypenum;
	private Integer originnum;
	private String comemntuser;
	private String comemnttext;
	private Date comemntdate;
	public Integer getComemntnum() {
		return comemntnum;
	}
	public void setComemntnum(Integer comemntnum) {
		this.comemntnum = comemntnum;
	}
	public Integer getComemnttypenum() {
		return comemnttypenum;
	}
	public void setComemnttypenum(Integer comemnttypenum) {
		this.comemnttypenum = comemnttypenum;
	}
	public Integer getOriginnum() {
		return originnum;
	}
	public void setOriginnum(Integer originnum) {
		this.originnum = originnum;
	}
	public String getComemntuser() {
		return comemntuser;
	}
	public void setComemntuser(String comemntuser) {
		this.comemntuser = comemntuser;
	}
	public String getComemnttext() {
		return comemnttext;
	}
	public void setComemnttext(String comemnttext) {
		this.comemnttext = comemnttext;
	}
	public Date getComemntdate() {
		return comemntdate;
	}
	public void setComemntdate(Date comemntdate) {
		this.comemntdate = comemntdate;
	}
	@Override
	public String toString() {
		return "ComentVO [comemntnum=" + comemntnum + ", comemnttypenum=" + comemnttypenum + ", originnum=" + originnum
				+ ", comemntuser=" + comemntuser + ", comemnttext=" + comemnttext + ", comemntdate=" + comemntdate
				+ "]";
	}

}
