package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardVO;
import org.zerock.domain.ComentVO;
import org.zerock.domain.FileVO;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.domain.UserVO;
import org.zerock.service.BoardService;
import org.zerock.service.ComentService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/board")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService boardService;
	
	@Inject
	private ComentService comentService;

	@RequestMapping(value = "/list")
	public void boardList(Model model) throws Exception {
		logger.info("// /board/list");

		List<BoardVO> list = boardService.selectBoardList();

		logger.info("// list.toString()=" + list.toString());
		model.addAttribute("list", list);
		logger.info(model.toString());
	}
	
	@RequestMapping(value = "/list2", method = RequestMethod.GET)
	public void boardList2(@ModelAttribute("cri") SearchCriteria cri, Model model,  /*user id 가져오기*/HttpServletRequest request) throws Exception {
		
		// userid 가져오기
		HttpSession session = request.getSession();
	      
	    UserVO userVo = (UserVO) session.getAttribute("login");
	    //userid 가져오기
	    
		logger.info("// /board/list");

		List<BoardVO> list = boardService.selectBoardList();

		logger.info("// list.toString()=" + list.toString());

		//model.addAttribute("list", list);
		logger.info(model.toString());
		
		logger.info(cri.toString());

	    model.addAttribute("list", boardService.listCriteria(cri));
	    //model.addAttribute("list", boardService.listSearchCriteria(cri));

	    PageMaker pageMaker = new PageMaker();
	    pageMaker.setCri(cri);

	    // pageMaker.setTotalCount(service.listCountCriteria(cri));
	    pageMaker.setTotalCount(boardService.listSearchCount(cri));

	    model.addAttribute("pageMaker", pageMaker);
	    
	    model.addAttribute("user", userVo);//userid 가져오기
	}
	


	@RequestMapping(value = "/view",  method = RequestMethod.GET)
	public String boardviewGet() throws Exception{
		return null;
	}
	
	 @RequestMapping(value = "/view2", method = RequestMethod.GET)
	 public void read(@RequestParam("num") int num, @ModelAttribute("cri") SearchCriteria cri, Model model,/*user id 가져오기*/HttpServletRequest request) throws Exception {
		// userid 가져오기
		 HttpSession session = request.getSession();
		      
		 UserVO userVo = (UserVO) session.getAttribute("login");
		    //userid 가져오기
		 System.out.println(num);
		 
		 List<FileVO> list = boardService.selectFileList(num);
		 model.addAttribute("filename", list);
		 model.addAttribute(boardService.read(num));
		 model.addAttribute("user", userVo);//userid 가져오기
	}
	
	/*
	 * @RequestMapping(value = "/view", method = RequestMethod.POST) public String
	 * boardviewPost(HttpServletRequest request, BoardVO board, RedirectAttributes
	 * rttr) throws Exception{ HttpSession session = request.getSession(); BoardVO
	 * NewBvo = boardService.selectBoardOne(board); logger.info(board.toString());
	 * logger.info(NewBvo.toString()); session.setAttribute("RT", NewBvo); return
	 * "redirect:/board/view"; }
	 */

	@RequestMapping(value = "/view", method = RequestMethod.POST)
 	public String boardviewPost(HttpServletRequest request, BoardVO board,ComentVO coment ,Model model, RedirectAttributes rttr) throws Exception{
		logger.info(coment.toString());
		logger.info(board.toString());
		HttpSession session = request.getSession();
	 	BoardVO NewBvo = boardService.selectBoardOne(board);
		List<ComentVO> list = comentService.selectComentList();
		logger.info(board.toString());
		logger.info(NewBvo.toString());
		session.setAttribute("RT", NewBvo);
		session.setAttribute("list", list);
		//model.addAttribute("list", list);
		//System.out.println("/*** /view post ����....");
		//rttr.addFlashAttribute("msg", "SUCCESS");
		//rttr.addFlashAttribute("list", list);
		logger.info(model.toString());
		return"redirect:/board/view";
	}
	
	 @RequestMapping(value = "/modify", method = RequestMethod.GET)
	 public void modify(BoardVO board, Model model, HttpServletRequest request) throws Exception {
		 HttpSession session = request.getSession();
		 
		 
		 UserVO userVo = (UserVO) session.getAttribute("login");
		 BoardVO NewBvo = boardService.selectBoardOne(board);
		
	      
		 logger.info(NewBvo.toString());
		 model.addAttribute("board", NewBvo);
		 model.addAttribute("user", userVo);
	}
	 
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String boardmodifyUpdate(BoardVO board) throws Exception {
		logger.info("// /board/modify");
		System.out.println(board);
		if(board.getFilename() == null) {
			logger.info("다음을 실행합니다./updateB");
			boardService.updateB(board);
		}else {
			logger.info("다음을 실행합니다/updateA");
			boardService.updateA(board);
		}
		System.out.println(board);
		return "redirect:/board/list2";
	}
		
	@RequestMapping(value = "/viewComent", method = RequestMethod.POST)
 	public String boardviewComentPost(ComentVO coment ,Model model, RedirectAttributes rttr) throws Exception{
		logger.info(coment.toString());
	 	ComentVO NewCom = comentService.insertComent(coment);
		return"/board/view";
	}
	
	@RequestMapping(value = "/delete",  method = RequestMethod.GET)
	public String boarddeletGet() throws Exception{
		return null;
	}
	
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String boarddeletPost(BoardVO board, ComentVO coment) throws Exception{
		BoardVO NewBvo = boardService.deleteBoardOne(board);
		ComentVO NewCom = comentService.deleteAll(coment);
		logger.info(board.toString());
		System.out.println(NewBvo);
		return "redirect:/board/list2";
	}
	
	@RequestMapping(value = "/write",  method = RequestMethod.GET)
	public String boardWrite(/*user id 가져오기*/HttpServletRequest request, Model model) throws Exception{
		// userid 가져오기
		HttpSession session = request.getSession();
		      
		UserVO userVo = (UserVO) session.getAttribute("login");
		model.addAttribute("user", userVo);//userid 가져오기
		return null;
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String boardWriteUpdate(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("// /board/write");
		System.out.println(board);
		System.out.println(board);
		boardService.insertBoard(board);
		return "redirect:/board/list2";
	}
}