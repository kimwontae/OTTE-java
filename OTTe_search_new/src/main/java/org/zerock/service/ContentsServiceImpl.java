package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ContentsVO;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.mapper.ContentsMapper;

@Service
//@Repository
public class ContentsServiceImpl implements ContentsService {

	@Autowired
	private ContentsMapper ContentsMapper;

	@Transactional
	@Override
	//	평점순으로 컨텐츠 정렬
	public List<ContentsVO> selectTopOrder() throws Exception {
		return ContentsMapper.selectTopOrder();
	}

	@Override
	//	한국컨텐츠만 평점순으로 컨텐츠 정렬
	public List<ContentsVO> selectKoreanOrder() throws Exception {
		return ContentsMapper.selectKoreanOrder();
	}
	
	@Override
	//	방영순으로 컨텐츠 정렬
	public List<ContentsVO> selectLatestOrder() throws Exception {
		return ContentsMapper.selectLatestOrder();
	}

	@Override
	// 컨텐츠 디테일뷰
	public ContentsVO view(Integer contentsid) throws Exception {
		return ContentsMapper.view(contentsid);
	}

	@Override
	//	검색기능
	public List<ContentsVO> selectSearch(SearchCriteria cri) throws Exception {
		return ContentsMapper.selectSearch(cri);
	}

	@Override
	//	추천기능
	public List<ContentsVO> selectRecommend(UserVO userVo) throws Exception {
		return ContentsMapper.selectRecommend(userVo);
	}
	
	@Override
	//	위시리스트 뷰
	public List<ContentsVO> selectWishlist(UserVO userVo) throws Exception {
		return ContentsMapper.selectWishlist(userVo);
	}

	@Override
	//	리뷰보기
	public List<ContentsVO> selectViewReply(Integer contentsid) throws Exception {
		return ContentsMapper.selectViewReply(contentsid);
	}

	@Override
	//	평점보기
	public ContentsVO selectAvgscore(Integer contentsid) throws Exception {
		return ContentsMapper.selectAvgscore(contentsid);
	}

	@Override
	//	리뷰갯수
	public ContentsVO selectReviewcnt(Integer contentsid) throws Exception {
		return ContentsMapper.selectReviewcnt(contentsid);
	}

	@Override
	//	리뷰추가
	public void addReview(ContentsVO vo) {
		ContentsMapper.addReview(vo);
	}

}
