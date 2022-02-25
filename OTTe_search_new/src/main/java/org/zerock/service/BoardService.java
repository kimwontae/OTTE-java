package org.zerock.service;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.FileVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.SearchCriteria;

public interface BoardService {
	List<BoardVO> selectBoardList() throws Exception;
	
	List<FileVO> selectFileList(Integer num) throws Exception;

	
	public void insertBoard(BoardVO board) throws Exception;
	
	public BoardVO selectBoardOne(BoardVO board) throws Exception;
	
	public BoardVO deleteBoardOne(BoardVO board) throws Exception;
	
	public BoardVO read(Integer num) throws Exception;
	
	public void updateA(BoardVO board) throws Exception;
	
	public void updateB(BoardVO board) throws Exception;
	
	public List<BoardVO> listAll() throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer num)throws Exception;



}
