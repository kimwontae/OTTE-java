package org.zerock.controller;

import java.util.List;
import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.ContentsVO;
import org.zerock.service.ContentsService;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;

/**
 * Handles requests for the application home page.
 */
@Controller

@RequestMapping(value = "/")
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Inject
	private ContentsService contentsService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String gohomepage(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");
		
		model.addAttribute("user", userVo);
		List<ContentsVO> top = contentsService.selectTopOrder();
		model.addAttribute("top", top);

		List<ContentsVO> korean = contentsService.selectKoreanOrder();
		model.addAttribute("korean", korean );
		 
		List<ContentsVO> latest = contentsService.selectLatestOrder();
		model.addAttribute("latest", latest );
		
		return "/main/home";
	}

	@RequestMapping(value = "main/home", method = RequestMethod.GET)
	public String gohome(Model model, HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");
		
		model.addAttribute("user", userVo);
		List<ContentsVO> top = contentsService.selectTopOrder();
		model.addAttribute("top", top);
		List<ContentsVO> korean = contentsService.selectKoreanOrder();
		model.addAttribute("korean", korean ); 
		List<ContentsVO> latest = contentsService.selectLatestOrder();
		model.addAttribute("latest", latest );
		return "/main/home";
	}

	@RequestMapping(value = "main/latest", method = RequestMethod.GET)
	public String golastest(Model model) throws Exception {
		List<ContentsVO> latest = contentsService.selectLatestOrder();
		model.addAttribute("latest", latest);

		return "/main/latest";
	}
	
	@RequestMapping(value = "main/recommend", method = RequestMethod.GET)
	public String gorecommend(LoginDTO usernum, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");
		logger.info("/* userVo="+userVo.toString());
		List<ContentsVO> recommend = contentsService.selectRecommend(userVo);
		model.addAttribute("recommend", recommend);
		return "/main/recommend";
	}


	
	

	@RequestMapping(value = "main/wishlist", method = RequestMethod.GET)
	public String gowishlist(LoginDTO usernum, Model model, HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");
		logger.info("/* userVo="+userVo.toString());
		List<ContentsVO> wish = contentsService.selectWishlist(userVo);
		model.addAttribute("wish", wish);
		return "/main/wishlist";
	}

	@RequestMapping(value = "main/korean", method = RequestMethod.GET)
	public String gokorean(Model model) throws Exception {
		List<ContentsVO> korean = contentsService.selectKoreanOrder();
		model.addAttribute("korean", korean);

		return "/main/korean";
	}

	@RequestMapping(value = "main/top", method = RequestMethod.GET)
	public String gotop(Model model) throws Exception {

		List<ContentsVO> top = contentsService.selectTopOrder();
		model.addAttribute("top", top);

		return "/main/top";
	}
	
}
