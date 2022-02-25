package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.GenreVO;

public interface FavoriteMapper {
	// 영상 등록
	List<ActorVO> select();
	
	List<GenreVO> selectgenre();
	
	List<DirectorVO> selectdirector();
}
