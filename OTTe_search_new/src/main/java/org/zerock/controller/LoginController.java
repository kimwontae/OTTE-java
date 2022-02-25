package org.zerock.controller;

import java.util.Date;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.WebUtils;
import org.zerock.domain.UserVO;
import org.zerock.dto.LoginDTO;
import org.zerock.service.UserService;

@Controller
@RequestMapping("/user")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Inject
	private UserService service;
	@Inject
	BCryptPasswordEncoder pwdEncoder;

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public void loginGET(@ModelAttribute("dto") LoginDTO dto) {

	}
	

	// 로그인 post
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public void login(LoginDTO dto, HttpSession session, Model model) throws Exception {
		logger.info("post login");

		//session.getAttribute("login");
		UserVO vo = service.login(dto);
		boolean pwdMatch = false;

		if (vo != null) {
			pwdMatch = pwdEncoder.matches(dto.getUserpassword(), vo.getUserpassword());
		}
		
		if (vo == null || pwdMatch == false ) {
			return;
		}
		
		model.addAttribute("userVO", vo);
				
	}


	// 로그아웃 GET
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws Exception {

		Object obj = session.getAttribute("login");
		// System.out.println("/* obj="+obj);

		if (obj != null) {
			UserVO vo = (UserVO) obj;

			session.removeAttribute("login");
			session.invalidate();

			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");

			/*if (loginCookie != null) {
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0);
				response.addCookie(loginCookie);
				service.keepLogin(vo.getUseremail(), session.getId(), new Date());*/
			}
		

		return "user/logout";
	}

}
