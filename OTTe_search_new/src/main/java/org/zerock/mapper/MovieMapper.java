package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.MovieFileVO;
import org.zerock.domain.MovieVO;
import org.zerock.domain.PagingVO;

public interface MovieMapper {
	
	// 영상 등록
	public void insertMovie(MovieVO vo) throws Exception;
	
	public void insertActorjoin(MovieVO vo) throws Exception;
	
	// 영상 이미지 등록
	public void insertMovieImg(@Param("contentsid") Integer contentsid, @Param("moviefilename") String fileName) throws Exception;

	// 영상 이미지 등록
	public void deleteMovie(MovieVO vo) throws Exception;

	// 영상 List 조회
	List<MovieVO> selectMovie();

	public MovieVO getPage(int contentsid);

	// 영상 수정
	public MovieVO modify(MovieVO movie);
	
	// 영상 삭제
	public int delete(int contentsid);
	
	// 게시물 총 갯수
	public int countBoard();

	// 페이징 처리 게시글 조회
	public List<MovieVO> selectBoard(PagingVO vo);
	
	// 아이디 중복체크
		public int idChk(MovieVO vo) throws Exception;
		
		List<MovieVO> selectmoviename();
}
