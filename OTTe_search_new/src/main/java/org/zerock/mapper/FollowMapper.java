package org.zerock.mapper;

import java.util.Map;

import org.zerock.domain.ContentsVO;
import org.zerock.domain.FollowVO;

public interface FollowMapper {
	
	void addFollow(Map<String, Integer> paramMap);

	void removeFollow(Map<String, Integer> paramMap);

	FollowVO checkFollow(Map<String, Integer> paramMap);
}
