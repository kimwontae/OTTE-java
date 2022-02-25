package org.zerock.service;

import java.util.Date;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
	
	private static String namespace = "org.zerock.mapper.MemberMapper";
	
	@Inject
	SqlSession sql;

	@Override
	public UserVO login(LoginDTO dto) throws Exception {

		return userMapper.login(dto);
	}

	@Override
	public void keepLogin(String uid, String sessionId, Date next) throws Exception {

		userMapper.keepLogin(uid, sessionId, next);

	}

	@Override
	public UserVO checkLoginBefore(String value) {

		return userMapper.checkUserWithSessionKey(value);		
	}
	
	@Override
	public void memberUpdate(LoginDTO dto) throws Exception {

		// 받은 vo를 매퍼로 보내줍니다.
		sql.update(namespace + ".memberUpdate", dto);

	}
	
}
