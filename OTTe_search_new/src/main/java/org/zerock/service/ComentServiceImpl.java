package org.zerock.service;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ComentVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.ComentMapper;

@Service
//@Configuration
//@MapperScan("org.zerock.mapper")
public class ComentServiceImpl implements ComentService {

	@Autowired
	private ComentMapper comentMapper;

	@Override
	@Transactional
	public List<ComentVO> selectComentList() throws Exception {
		return comentMapper.selectComentList();
	}

	public ComentVO insertComent(ComentVO coment) throws Exception {
		return comentMapper.insertComent(coment);
	}

	@Override
	public void addReply(ComentVO vo) throws Exception {

		comentMapper.create(vo);
	}

	@Override
	public List<ComentVO> listReply(Integer num) throws Exception {

		return comentMapper.list(num);
	}

	@Override
	public void modifyReply(ComentVO vo) throws Exception {

		comentMapper.update(vo);
	}

	@Override
	public void removeReply(Integer comemntnum) throws Exception {

		comentMapper.delete(comemntnum);
	}
	
	public ComentVO deleteAll(ComentVO coment) throws Exception{
		comentMapper.deleteAll(coment);
		return coment;
	}
	

	@Override
	public List<ComentVO> listReplyPage(Integer originnum, Criteria cri) throws Exception {

		return comentMapper.listPage(originnum, cri);
	}

	@Override
	public int count(Integer originnum) throws Exception {

		return comentMapper.count(originnum);
	}
}
