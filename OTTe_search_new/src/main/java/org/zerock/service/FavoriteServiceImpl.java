package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ActorVO;
import org.zerock.domain.DirectorVO;
import org.zerock.domain.GenreVO;
import org.zerock.mapper.FavoriteMapper;

@Service
public class FavoriteServiceImpl implements FavoriteService {
	
//에러해결코드 2 inject를 private autowired로
	@Inject SqlSession sql;
//
	@Autowired
	private FavoriteMapper favoriteMapper;
	
	private static String namespace="org.zerock.mapper.FavoriteMapper";

	 
	 @Transactional
		@Override
		public List<ActorVO> select() throws Exception {
			return favoriteMapper.select();
		}
	 
	 
		@Override
		public List<DirectorVO> selectdirector() throws Exception {
			return favoriteMapper.selectdirector();
		}
	 
	 @Override
		public List<GenreVO> selectgenre() throws Exception {
			return favoriteMapper.selectgenre();
		}

	}


