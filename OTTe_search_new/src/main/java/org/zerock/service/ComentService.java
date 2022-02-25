package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.ComentVO;
import org.zerock.domain.Criteria;

public interface ComentService {
	List<ComentVO> selectComentList() throws Exception;

	public ComentVO insertComent(ComentVO coment) throws Exception;

	public void addReply(ComentVO vo) throws Exception;

	public List<ComentVO> listReply(Integer num) throws Exception;

	public void modifyReply(ComentVO vo) throws Exception;
	
	public ComentVO deleteAll(ComentVO coment) throws Exception;

	public void removeReply(Integer comemntnum) throws Exception;

	public List<ComentVO> listReplyPage(Integer originnum, Criteria cri) throws Exception;

	public int count(Integer originnum) throws Exception;

}
