package gg.hta.lol.controller.community;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.service.ReplyService;
import gg.hta.lol.util.PageUtil;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.ReplyVo;

//asdf
@Controller
public class ListController {
	@Autowired private CommunityService service;
	@Autowired private ReplyService reservice;
	
	@GetMapping(value="/community/list")
	public ModelAndView list(@RequestParam(value = "pageNum",defaultValue = "1")int pageNum,@RequestParam(value = "cNum",defaultValue = "0")int cNum,@RequestParam(value = "vrh",defaultValue = "pNum")String vrh,@RequestParam(value = "commentCount",defaultValue = "1")int commentCount,String field,String keyword) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
      
		map.put("vrh", vrh);
		map.put("cNum", cNum);
		map.put("commentCount", commentCount);
      
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
      
      
		List<CommunityVo> list=null;
      	if(cNum==0) {
      		list=service.wholeList(map);
      	}else {
      		list=service.list(map);
      	}
      	System.out.println(list);
      	ModelAndView mv=new ModelAndView(".header2.community.list");
      	mv.addObject("list", list);
      	mv.addObject("pu",pu);
      	mv.addObject("field", field);
      	mv.addObject("keyword",keyword);
      	mv.addObject("cNum", cNum);
      	mv.addObject("vrh", vrh);
      	mv.addObject("commentCount",commentCount);
      	return mv;
	}
	
	@GetMapping(value = "/member/member/boardList")
	public String List(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, Principal principal, Model m) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = service.boardCount(principal.getName());
		PageUtil pu = new PageUtil(pageNum, 10,5,totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("username", principal.getName());
		List<CommunityVo> list = service.boardList(map);
		m.addAttribute("list", list);
		m.addAttribute("pu",pu);
		return ".mypage.boardList";
	}
	@GetMapping(value = "/member/member/replyList")
	public String replyList(@RequestParam(value="pageNum", defaultValue = "1")int pageNum, Principal principal, Model m) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int totalRowCount = reservice.replyCount(principal.getName());
		PageUtil pu = new PageUtil(pageNum, 10,5,totalRowCount);
		int startRow = pu.getStartRow();
		int endRow = pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		map.put("username", principal.getName());
		List<ReplyVo> list = reservice.replyList(map);
		m.addAttribute("list", list);
		m.addAttribute("pu",pu);
		return ".mypage.replyList";
	}
	
	
	
	
	@GetMapping("/community/boardList")
	public ModelAndView boardList(@RequestParam(value = "pageNum",defaultValue = "1")int pageNum,@RequestParam(value = "cNum",defaultValue = "1")int cNum,@RequestParam(value = "vrh",defaultValue = "pNum")String vrh,@RequestParam(value = "commentCount",defaultValue = "1")int commentCount,String field,String keyword) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		
		map.put("vrh", vrh);
		map.put("cNum", cNum);
		map.put("commentCount", commentCount);
		
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(pageNum, 10, 10, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<CommunityVo> list=service.list(map);
		System.out.println(list);
		ModelAndView mv=new ModelAndView(".adminpage.community.list");
		mv.addObject("list", list);
		mv.addObject("pu",pu);
		mv.addObject("field", field);
		mv.addObject("keyword",keyword);
		mv.addObject("cNum", cNum);
		mv.addObject("vrh", vrh);
		mv.addObject("commentCount",commentCount);
		return mv;
	}
}