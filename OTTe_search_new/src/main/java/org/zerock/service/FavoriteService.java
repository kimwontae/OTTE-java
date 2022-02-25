package org.zerock.service;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.GenreVO;
public interface FavoriteService {

	 /* 영상물 조회 */

	List<GenreVO> selectgenre() throws Exception;
	
	List<ActorVO> select()throws Exception;
	
	List<DirectorVO> selectdirector() throws Exception;
}
