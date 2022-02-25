package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.FileVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.mapper.BoardMapper;

@Repository

//@Configuration
//@MapperScan("org.zerock.mapper")
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardMapper boardMapper;

	@Override
	@Transactional
	public List<BoardVO> selectBoardList() throws Exception {
		return boardMapper.selectBoardList();
	}

	public void insertBoard(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.insertBoard(board);
	    String[] files = board.getFilenames();
	    String[] nuwName = {" "};
	    if(files == null) {
	    	for (String fileName : nuwName) {
				boardMapper.addAttach(fileName);
		    }
	    } else {
	    	for (String fileName : files) {
	    		fileName = fileName.replace("/s_", "/");
				boardMapper.addAttach(fileName);
		    }
	    }
	    
	    
	}

	public BoardVO selectBoardOne(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardOne(board);
	}

	public BoardVO deleteBoardOne(BoardVO board) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.deleteBoardOne(board);
	}

	public BoardVO read(Integer num) throws Exception {
		return boardMapper.read(num);
	}
	
	
	public void updateA(BoardVO board) throws Exception {

		boardMapper.updateA(board);
	}
	
	public void updateB(BoardVO board) throws Exception {

		boardMapper.updateB(board);
	}

	@Override
	public List<BoardVO> listAll() throws Exception {
		return boardMapper.listAll();
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return boardMapper.listCriteria(cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {

		return boardMapper.countPaging(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return boardMapper.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {

		return boardMapper.listSearchCount(cri);
	}
	
	@Override
	public List<String> getAttach(Integer num) throws Exception {
		    
	    return boardMapper.getAttach(num);
	}  
	
	public List<FileVO> selectFileList(Integer num) throws Exception {
	    return boardMapper.selectFileList(num);
	}  
	

}
