package gg.hta.lol.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.util.PageUtil;
import gg.hta.lol.vo.CommunityVo;


@Controller
public class HomeController {
	
	@Autowired private CommunityService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		HashMap<String,Object> map=new HashMap<String, Object>();
		map.put("filed", "");
		map.put("keyword", "");
		map.put("vrh", "hit");
		map.put("cNum", 1);
		map.put("commentCount", 0);
		
		int totalRowCount=service.count(map);
		PageUtil pu=new PageUtil(1, 10, 10, totalRowCount);
		int startRow=pu.getStartRow();
		int endRow=pu.getEndRow();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		
		List<CommunityVo> list = service.wholeList(map);
		System.out.println(list);
		
		model.addAttribute("list", list);
		
		return ".header.home";
	}
	
}
