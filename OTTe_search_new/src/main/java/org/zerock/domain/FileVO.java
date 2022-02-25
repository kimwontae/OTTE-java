package org.zerock.domain;

import java.util.Date;

import org.springframework.stereotype.Component;

public class FileVO {
	
	private Integer boardnum;
	private String filename;
	private Date regDate;
	
	
	public Integer getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(Integer boardnum) {
		this.boardnum = boardnum;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "FileVO [boardnum=" + boardnum + ", filename=" + filename + ", regDate=" + regDate + "]";
	}
}
