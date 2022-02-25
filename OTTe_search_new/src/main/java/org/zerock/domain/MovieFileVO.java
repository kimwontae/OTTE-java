package org.zerock.domain;

import java.util.Arrays;
import java.util.Date;
public class MovieFileVO {
	private Integer contentsid;
	private Integer[] contentsids;
	private String moviefilename;
	private String[] moviefilenames;
	
	public Integer getContentsid() {
		return contentsid;
	}
	public void setContentsid(Integer contentsid) {
		this.contentsid = contentsid;
	}
	public Integer[] getContentsids() {
		return contentsids;
	}
	public void setContentsids(Integer[] contentsids) {
		this.contentsids = contentsids;
	}
	public String getMoviefilename() {
		return moviefilename;
	}
	public void setMoviefilename(String moviefilename) {
		this.moviefilename = moviefilename;
	}
	public String[] getMoviefilenames() {
		return moviefilenames;
	}
	public void setMoviefilenames(String[] moviefilenames) {
		this.moviefilenames = moviefilenames;
	}
	@Override
	public String toString() {
		return "MovieFileVO [contentsid=" + contentsid + ", contentsids=" + Arrays.toString(contentsids)
				+ ", moviefilename=" + moviefilename + ", moviefilenames=" + Arrays.toString(moviefilenames) + "]";
	}
	
	
	
}
