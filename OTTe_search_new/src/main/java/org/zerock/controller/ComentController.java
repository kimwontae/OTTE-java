package org.zerock.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageMaker;
import org.zerock.domain.ComentVO;
import org.zerock.service.ComentService;

@RestController
@RequestMapping("/replies")
public class ComentController {

  @Inject
  private ComentService comentService;
  
  private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

  @RequestMapping(value = "/insert", method = RequestMethod.POST)
  public ResponseEntity<String> register(@RequestBody ComentVO vo) {
	  logger.info(vo.toString());
    ResponseEntity<String> entity = null;
    try {
    	comentService.addReply(vo);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/all/{num}", method = RequestMethod.GET)
  public ResponseEntity<List<ComentVO>> list(@PathVariable("num") Integer num) {

    ResponseEntity<List<ComentVO>> entity = null;
    try {
      entity = new ResponseEntity<>(comentService.listReply(num), HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
    }

    return entity;
  }

  @RequestMapping(value = "/{comemntnum}", method = { RequestMethod.PUT, RequestMethod.PATCH })
  public ResponseEntity<String> update(@PathVariable("comemntnum") Integer comemntnum, @RequestBody ComentVO vo) {
    ResponseEntity<String> entity = null;
    try {
      vo.setComemntnum(comemntnum);
      System.out.println(vo);
      comentService.modifyReply(vo);
      System.out.println("여기까지 실행 되어습니다..");
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/{comemntnum}", method = RequestMethod.DELETE)
  public ResponseEntity<String> remove(@PathVariable("comemntnum") Integer comemntnum) {

    ResponseEntity<String> entity = null;
    try {
    	comentService.removeReply(comemntnum);
      entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

  @RequestMapping(value = "/{originnum}/{page}", method = RequestMethod.GET)
  public ResponseEntity<Map<String, Object>> listPage(
      @PathVariable("originnum") Integer originnum,
      @PathVariable("page") Integer page) {
	  System.out.println(originnum);
	  System.out.println(page);
	  System.out.println("실행중입니다.");
    ResponseEntity<Map<String, Object>> entity = null;
    
    try {
      Criteria cri = new Criteria();
      cri.setPage(page);

      PageMaker pageMaker = new PageMaker();
      pageMaker.setCri(cri);
      System.out.println("실행중입니다. 2회차");

      Map<String, Object> map = new HashMap<String, Object>();
      List<ComentVO> list = comentService.listReplyPage(originnum, cri);
      System.out.println(list);

      map.put("list", list);

      int replyCount = comentService.count(originnum);
      pageMaker.setTotalCount(replyCount);

      map.put("pageMaker", pageMaker);

      entity = new ResponseEntity<Map<String, Object>>(map, HttpStatus.OK);

    } catch (Exception e) {
      e.printStackTrace();
      entity = new ResponseEntity<Map<String, Object>>(HttpStatus.BAD_REQUEST);
    }
    return entity;
  }

}
