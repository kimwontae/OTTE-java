package org.zerock.mapper;

import java.util.Date;

import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

public interface UserMapper {

	public UserVO login(LoginDTO dto) throws Exception;

	public void keepLogin(String uid, String sessionId, Date next);

	public UserVO checkUserWithSessionKey(String value);
}
