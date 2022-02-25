package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.FileVO;
import org.zerock.domain.SearchCriteria;

public interface BoardMapper {
	List<BoardVO> selectBoardList() throws Exception;

	public BoardVO insertBoard(BoardVO board);

	public BoardVO selectBoardOne(BoardVO board);

	public BoardVO deleteBoardOne(BoardVO board);

	public BoardVO read(Integer num);
	
	public void updateA(BoardVO board) throws Exception;
	
	public void updateB(BoardVO board) throws Exception;

	public List<BoardVO> listAll() throws Exception;

	public List<BoardVO> listPage(int page) throws Exception;

	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;
	
	public void addAttach(String fullName)throws Exception;

	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
	
	public List<String> getAttach(Integer num)throws Exception;

	public List<FileVO> selectFileList(Integer num);
}
