package org.zerock.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.ContentsVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.SearchCriteria;
import org.zerock.service.ContentsService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/search/*")
public class SearchController {

	private static final Logger logger = LoggerFactory.getLogger(SearchController.class);

	@Inject
	private ContentsService contentsService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String SearchGet(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		return "/search/searchform";
	}

	@RequestMapping(value = "/result", method = RequestMethod.GET)
	public String Searchget(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		logger.info("/* cri="+cri.toString());
		List<ContentsVO> search = contentsService.selectSearch(cri);
		logger.info("/* cri="+search.toString());
		model.addAttribute("search", search);

		// model.addAttribute("list", service.listCriteria(cri));
		//model.addAttribute("list", contentsService.selectSearch(cri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);

		model.addAttribute("pageMaker", pageMaker);

		return "/search/result";
	}
}
