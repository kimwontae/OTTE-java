package org.zerock.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.FollowVO;
import org.zerock.mapper.FollowMapper;

@Service
//@Repository
public class FollowServiceImpl implements FollowService {

	@Autowired
	private FollowMapper FollowMapper;

	@Transactional
	@Override
	//	찜하기
	public void addFollow(Integer contentsid, Integer usernum) throws Exception {
		Map<String, Integer> paramMap = new HashMap<>();

		paramMap.put("contentsid", contentsid);
		paramMap.put("usernum", usernum);
		
		FollowMapper.addFollow(paramMap);

	}

	@Override
	//	찜취소
	public void removeFollow(Integer contentsid, Integer usernum) throws Exception {
		Map<String, Integer> paramMap = new HashMap<>();

		paramMap.put("contentsid", contentsid);
		paramMap.put("usernum", usernum);
		
		FollowMapper.removeFollow(paramMap);

	}

	@Override
	//	찜여부 체크
	public FollowVO checkFollow(Integer contentsid, Integer usernum) throws Exception {
		// 컨텐츠아이디와 유저넘버를 hashmap 형태로 저장하여 전달하여 값이 존재하면 찜
		Map<String, Integer> paramMap = new HashMap<>();
		
		paramMap.put("contentsid", contentsid);
		paramMap.put("usernum", usernum);
		
		return FollowMapper.checkFollow(paramMap);
	
	}

}
