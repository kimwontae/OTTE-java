package org.zerock.domain;

import java.util.Date;
public class MovieVO {
	private Integer contentsid;
	private String nationcode;
	private Integer ottid;
	private Integer gradeid;
	private Integer classid;
	private String contentstitle;
	private String contentssummary;
	private Date contentsstart;
	private Integer contentsseason;
	private Integer contentsepisode;
	private Double contentsscore;
	private Integer contentsduration;
	public Integer getContentsid() {
		return contentsid;
	}
	public void setContentsid(Integer contentsid) {
		this.contentsid = contentsid;
	}
	public String getNationcode() {
		return nationcode;
	}
	public void setNationcode(String nationcode) {
		this.nationcode = nationcode;
	}
	public Integer getOttid() {
		return ottid;
	}
	public void setOttid(Integer ottid) {
		this.ottid = ottid;
	}
	public Integer getGradeid() {
		return gradeid;
	}
	public void setGradeid(Integer gradeid) {
		this.gradeid = gradeid;
	}
	public Integer getClassid() {
		return classid;
	}
	public void setClassid(Integer classid) {
		this.classid = classid;
	}
	public String getContentstitle() {
		return contentstitle;
	}
	public void setContentstitle(String contentstitle) {
		this.contentstitle = contentstitle;
	}
	public String getContentssummary() {
		return contentssummary;
	}
	public void setContentssummary(String contentssummary) {
		this.contentssummary = contentssummary;
	}
	public Date getContentsstart() {
		return contentsstart;
	}
	public void setContentsstart(Date contentsstart) {
		this.contentsstart = contentsstart;
	}
	public Integer getContentsseason() {
		return contentsseason;
	}
	public void setContentsseason(Integer contentsseason) {
		this.contentsseason = contentsseason;
	}
	public Integer getContentsepisode() {
		return contentsepisode;
	}
	public void setContentsepisode(Integer contentsepisode) {
		this.contentsepisode = contentsepisode;
	}
	public Double getContentsscore() {
		return contentsscore;
	}
	public void setContentsscore(Double contentsscore) {
		this.contentsscore = contentsscore;
	}
	public Integer getContentsduration() {
		return contentsduration;
	}
	public void setContentsduration(Integer contentsduration) {
		this.contentsduration = contentsduration;
	}
	@Override
	public String toString() {
		return "MovieVO [contentsid=" + contentsid + ", nationcode=" + nationcode + ", ottid=" + ottid + ", gradeid="
				+ gradeid + ", classid=" + classid + ", contentstitle=" + contentstitle + ", contentssummary="
				+ contentssummary + ", contentsstart=" + contentsstart + ", contentsseason=" + contentsseason
				+ ", contentsepisode=" + contentsepisode + ", contentsscore=" + contentsscore + ", contentsduration="
				+ contentsduration + "]";
	}
	
	
	
	/*
	
*/
	
}
