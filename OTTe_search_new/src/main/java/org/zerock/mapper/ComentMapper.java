package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ComentVO;
import org.zerock.domain.Criteria;

public interface ComentMapper {
	List<ComentVO> selectComentList() throws Exception;
	public ComentVO insertComent(ComentVO coment);
	
	public List<ComentVO> list(Integer originnum) throws Exception;

	public void create(ComentVO vo) throws Exception;

	public void update(ComentVO vo) throws Exception;

	public void delete(Integer comemntnumm) throws Exception;
	
	public void deleteAll(ComentVO coment) throws Exception;

	public List<ComentVO> listPage(
	      @Param("originnum")Integer originnum, @Param("cri")Criteria cri) throws Exception;

	public int count(Integer originnum) throws Exception;
}
