package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MovieFileVO;
import org.zerock.domain.MovieVO;
import org.zerock.domain.PagingVO;
import org.zerock.mapper.MovieMapper;

@Service
public class MovieServiceImpl implements MovieService {
	
//에러해결코드 2 inject를 private autowired로
	@Inject SqlSession sql;
//
	@Autowired
	private MovieMapper movieMapper;
	
	private static String namespace="org.zerock.mapper.MovieMapper";
	
	@Override
	public void insertMovie(MovieVO vo) throws Exception {
		sql.insert(namespace+".insertMovie", vo);
		sql.insert(namespace+".insertActorjoin", vo);
	}
	
	@Override	
	public void insertMovieImg(Integer contentsid, String[] moviefilenames) throws Exception {

		for (String fileName : moviefilenames) {
			fileName = fileName.replace("/s_", "/");
			movieMapper.insertMovieImg(contentsid,fileName);
	    }
	}
	
	@Override
	public int idChk(MovieVO vo) throws Exception {
		int result = sql.selectOne(namespace + ".idChk", vo);
		return result;
	}
	
	@Override
	public void deleteMovie(MovieVO vo) throws Exception {
		sql.delete(namespace+".deleteMovie", vo);
	}
	
	@Transactional
	@Override
	public List<MovieVO> selectMovie() throws Exception {
		return movieMapper.selectMovie();
	}
	 @Override
	    public MovieVO getPage(int contentsid) {
	         
	        return movieMapper.getPage(contentsid);
	    }  
	  
	 
	 @Override
	    public MovieVO modify(MovieVO movie) {
	        
	        return movieMapper.modify(movie);
	    }
	  
	 
	 
	 @Override
	    public int delete(int contentsid) {
	        
	        return movieMapper.delete(contentsid);
	    }    
	 
	 @Override
	 public int countBoard() {
	 	return movieMapper.countBoard();
	 }

	 @Override
	 public List<MovieVO> selectBoard(PagingVO vo) {
	 	return movieMapper.selectBoard(vo);
	 }
	 
	 
	 @Override
	 public List<MovieVO> selectmoviename() {
		 return movieMapper.selectmoviename();
	 }
	 
		/*
		 * @Service public class UserServiceImpl implements UserService{
		 * 
		 * // 아이디 중복 체크
		 * 
		 * @Override public int idCheck(String id) { int cnt = MovieMapper.idCheck(id);
		 * return cnt; } }
		 */
	}


