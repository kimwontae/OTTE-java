package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.FavoriteVO;
import org.zerock.domain.UserVO;

public interface MemberMapper {

	// 회원가입
	public void register(UserVO vo) throws Exception;

	// 로그인
	public UserVO login(UserVO vo) throws Exception;

	// 회원정보 수정
	public void memberUpdate(UserVO vo) throws Exception;

	// 회원 탈퇴
	public void memberDelete(UserVO vo) throws Exception;

	// 패스워드 체크
	public int passChk(UserVO vo) throws Exception;

	// 아이디 중복체크
	public int idChk(UserVO vo) throws Exception;

	// 이메일 중복체크
	public int emailChk(UserVO vo) throws Exception;

	public int memChk(UserVO vo) throws Exception;

	public String randomPw(UserVO vo) throws Exception;

	public void insertfavorite(FavoriteVO vo) throws Exception;

	public void insertactor(ActorVO vo) throws Exception;

	public void insertdirector(DirectorVO vo) throws Exception;
	
	//로그인후 프로필창에서 내가 선호하는 항목 출력
	List<FavoriteVO> selectfavoritegenre(UserVO userVo);
	
	List<FavoriteVO> selectfavoriteactor(UserVO userVo);
	
	List<FavoriteVO> selectfavoritedirector(UserVO userVo);
	
	public void deletemyfavorite(UserVO userVo) throws Exception;


}
