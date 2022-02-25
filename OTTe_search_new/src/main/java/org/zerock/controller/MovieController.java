package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MovieVO;
import org.zerock.domain.PagingVO;
import org.zerock.domain.UserVO;
import org.zerock.service.MovieService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping(value = "/movie")
public class MovieController {

	private static final Logger logger = LoggerFactory.getLogger(MovieController.class);

	@Inject
	MovieService service;

	
	//영상 조회 화면 post
	@RequestMapping(value = "/selectmovie", method = RequestMethod.POST)
	public String postSelectMovie() throws Exception {
		logger.info("post Select Movie");

		service.selectMovie();

		return "/movie/selectmovie";
	}

	// 영상등록 get
		@RequestMapping(value = "/insertmovie", method = RequestMethod.GET)
		public String getdirector(Model model) throws Exception {

			logger.info("get movie name");
			List<MovieVO> movienameservice = service.selectmoviename();
			model.addAttribute("movienameservice", movienameservice);

			return "/movie/insertmovie";
		}
	
		
	// 영상 이미지 등록 get
	@RequestMapping(value = "/insertmovieimg", method = RequestMethod.GET)
	public void getInsertMovieimg() throws Exception {
		logger.info("get Insert Movie");
	}
	
	// 영상등록시 id중복체크
	@ResponseBody
	@RequestMapping(value = "/idChk", method = RequestMethod.POST)
	public int idChk(MovieVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}

	

	// 영상등록 post
	@RequestMapping(value = "/insertmovie", method = RequestMethod.POST)
	public String postInsertMovie(MovieVO vo, RedirectAttributes rttr, Model model) throws Exception {
		//logger.info("post Insert Movie");
 		service.insertMovie(vo);
 		rttr.addFlashAttribute("result", "enrol success");
		model.addAttribute("insertMovie",vo);
		model.addAttribute("insertMovie",vo);
		return "/movie/insertmovieimg";
	}
	
	// 영상 이미지 등록 post
	@RequestMapping(value = "/insertmovieimg", method = RequestMethod.POST)
	public String postInsertMovieimg(Integer contentsid, String[] moviefilenames) throws Exception {
		logger.info("*/ 입력된 contentsid값입니다. " + contentsid);
		logger.info("*/ 입력된 moviefilenames값입니다. " + moviefilenames);
		service.insertMovieImg(contentsid,moviefilenames);
		return "redirect:/movie/selectmovie";
	 }
	

	// 영상물 상세 조회
	@RequestMapping(value = "/get", method = RequestMethod.GET)
	public void mGetPageGET(int contentsid, Model model) {

		model.addAttribute("movieservice", service.getPage(contentsid));

	}
	//영상물 수정 페이지 이동
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void movieModifyGET(int contentsid, Model model) {

		model.addAttribute("movieservice", service.getPage(contentsid));

	}
	//영상물 수정 기능
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String MovieModifyPOST(MovieVO movie, RedirectAttributes rttr) {

		logger.info("SUCCESS MODIFY POST");

		service.modify(movie);

		rttr.addFlashAttribute("result", "modify success");

		return "redirect:/movie/selectmovie";

	}
	//영상물 삭제 기능
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String boardDeletePOST(int contentsid, RedirectAttributes rttr) {

		System.out.println("/* contentsid="+contentsid);
		service.delete(contentsid);

		rttr.addFlashAttribute("result", "delete success");

		return "redirect:/movie/selectmovie";
	}
	//페이징 기능을 추가한 영상물 조회
	@RequestMapping(value = "/selectmovie", method = RequestMethod.GET)
	public String selectmovie(PagingVO vo, Model model, HttpServletRequest request,
			@RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage) {

		int total = service.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "5";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");
		logger.info("/* userVoad="+userVo.toString());
		model.addAttribute("paging", vo);
		model.addAttribute("movieservice", service.selectBoard(vo));
		
		
		if(userVo.getAdmin() != null) {
			return "/movie/selectmovie";
			} else {
				return "redirect:/main/home";
			}
	}
	
	
	
	/*
	 * 
	 * 
	 * 
	 * 
	 * //영상삭제 get
	 * 
	 * @RequestMapping(value = "/deletemovie", method= RequestMethod.GET) public
	 * void getDeleteMovie() throws Exception { logger.info("get Delete Movie");
	 * 
	 * }
	 */
	
	/*
	 * // 영상등록 post
	 * 
	 * @RequestMapping(value = "/insertmovie", method = RequestMethod.POST) public
	 * String postInsertMovie(MovieVO vo, RedirectAttributes rttr) throws Exception
	 * {
	 * 
	 * logger.info("post Insert Movie"); int result = service.idChk(vo); try { if
	 * (result == 1) { return "/movie/insertmovie"; } else if (result == 0) {
	 * 
	 * service.insertMovie(vo); rttr.addFlashAttribute("result", "enrol success"); }
	 * }
	 * 
	 * catch (Exception e) { throw new RuntimeException(); } return
	 * "/movie/insertmovie";
	 * 
	 * }
	 */
	
	/*
	 * @RequestMapping(value = "selectmovie", method = RequestMethod.GET) public
	 * String goselectmovie(Model model) throws Exception {
	 * logger.info("get Select Movie"); List<MovieVO> movieservice =
	 * service.selectMovie(); model.addAttribute("movieservice", movieservice);
	 * 
	 * return "/movie/selectmovie"; }
	 */

}
