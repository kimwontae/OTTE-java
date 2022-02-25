package org.zerock.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.zerock.domain.ContentsVO;
import org.zerock.domain.FollowVO;
import org.zerock.domain.UserVO;
import org.zerock.service.ContentsService;
import org.zerock.service.FollowService;

@Controller
@RequestMapping(value = "/contents")
public class ContentsController {

	private static final Logger logger = LoggerFactory.getLogger(ContentsController.class);

	@Inject
	@Autowired
	private ContentsService contentsService;
	@Autowired
	private FollowService followService;

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void read(@RequestParam("contentsid") int contentsid, Model model, HttpServletRequest request)
			throws Exception {

		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");

		ContentsVO view = contentsService.view(contentsid);
		List<ContentsVO> viewReply = contentsService.selectViewReply(contentsid);
		ContentsVO avgScore = contentsService.selectAvgscore(contentsid);
		ContentsVO reviewcnt = contentsService.selectReviewcnt(contentsid);
		FollowVO checkfollow = followService.checkFollow(contentsid, userVo.getUsernum());

		logger.info("/* checkfollow=" + checkfollow.toString());
		model.addAttribute("checkfollow", checkfollow);
		model.addAttribute("reviewcnt", reviewcnt);
		model.addAttribute("avgScore", avgScore);
		model.addAttribute("viewReply", viewReply);
		model.addAttribute("view", view);

	}

	@RequestMapping(value = "/follow", method = RequestMethod.POST)
	public ResponseEntity<String> follow(@RequestParam("contentsid") int contentsid, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");

		ResponseEntity<String> entity = null;
		try {
			followService.addFollow(contentsid, userVo.getUsernum());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/unfollow", method = RequestMethod.POST)
	public ResponseEntity<String> unfollow(@RequestParam("contentsid") int contentsid, HttpServletRequest request) {

		HttpSession session = request.getSession();
		UserVO userVo = (UserVO) session.getAttribute("login");

		ResponseEntity<String> entity = null;
		try {
			followService.removeFollow(contentsid, userVo.getUsernum());
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "/replies", method = RequestMethod.POST)
	public ResponseEntity<String> replies(@RequestParam Integer rcontentsid, String reviewnatter,
			HttpServletRequest request) throws Exception {

		HttpSession session = request.getSession();
		UserVO uservo = (UserVO) session.getAttribute("login");

		System.out.println("test########" + rcontentsid);

		ContentsVO newconvo = new ContentsVO();
		newconvo.setContentsid(rcontentsid);
		newconvo.setReviewnatter(reviewnatter);
		newconvo.setUsernum(uservo.getUsernum());

		ResponseEntity<String> entity = null;
		try {
			contentsService.addReview(newconvo);
			entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
