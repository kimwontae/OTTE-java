package org.zerock.service;

import org.zerock.domain.FollowVO;

public interface FollowService {

	void addFollow(Integer contentsid, Integer usernum) throws Exception;

	void removeFollow(Integer contentsid, Integer usernum) throws Exception;
	
	public FollowVO checkFollow(Integer contentsid, Integer usernum) throws Exception;

}