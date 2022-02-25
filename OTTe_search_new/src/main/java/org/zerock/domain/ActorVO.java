package org.zerock.domain;

public class ActorVO {
	private Integer actorid;
	private String actorname;
	private String actorvalue;
	public Integer getActorid() {
		return actorid;
	}
	public void setActorid(Integer actorid) {
		this.actorid = actorid;
	}
	public String getActorname() {
		return actorname;
	}
	public void setActorname(String actorname) {
		this.actorname = actorname;
	}
	public String getActorvalue() {
		return actorvalue;
	}
	public void setActorvalue(String actorvalue) {
		this.actorvalue = actorvalue;
	}
	@Override
	public String toString() {
		return "ActorVO [actorid=" + actorid + ", actorname=" + actorname + ", actorvalue=" + actorvalue + "]";
	}
	
}
