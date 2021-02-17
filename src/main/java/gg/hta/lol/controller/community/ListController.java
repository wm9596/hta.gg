package gg.hta.lol.controller.community;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.service.ReplyService;
import gg.hta.lol.util.PageUtil;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.ReplyVo;

@Controller
public class ListController {
	@Autowired private CommunityService service;
	
	@RequestMapping("/community/list")
	public ModelAndView list(@RequestParam(value = "pageNum",defaultValue = "1")int pageNum,@RequestParam(value = "cNum",defaultValue = "1")int cNum, @RequestParam(value = "commentCount",defaultValue = "1")int commentCount,String field,String keyword) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("field", field);
		map.put("keyword",keyword);
		
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
		ModelAndView mv=new ModelAndView(".header2.community.list");
		mv.addObject("list", list);
		mv.addObject("pu",pu);
		mv.addObject("field", field);
		mv.addObject("keyword",keyword);
		mv.addObject("cNum", cNum);
		mv.addObject("commentCount",commentCount);
		return mv;
	}
}