package org.zerock.service;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.FavoriteVO;
import org.zerock.domain.UserVO;

public interface MemberService {

	public void register(UserVO vo) throws Exception;

	public void memberUpdate(UserVO vo) throws Exception;

	public void memberDelete(UserVO vo) throws Exception;

	public int passChk(UserVO vo) throws Exception;

	public int idChk(UserVO vo) throws Exception;
	
	public int emailChk(UserVO vo) throws Exception;
	
	public int memChk(UserVO vo) throws Exception;
	
	public String randomPw(UserVO vo) throws Exception;
	
	public void insertfavorite(FavoriteVO vo) throws Exception;

	public void insertactor(ActorVO vo) throws Exception;

	public void insertdirector(DirectorVO vo) throws Exception;
	
	//내가 선호하는 항목들  조회
	List<FavoriteVO> selectfavoritegenre(UserVO userVo) throws Exception;
	
	List<FavoriteVO> selectfavoriteactor(UserVO userVo) throws Exception;
	
	List<FavoriteVO> selectfavoritedirector(UserVO userVo) throws Exception;
	
	public void deletemyfavorite(UserVO userVo) throws Exception;
}
