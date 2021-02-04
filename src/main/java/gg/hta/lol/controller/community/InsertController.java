package gg.hta.lol.controller.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.vo.CommunityVo;

@Controller
public class InsertController {
	@Autowired private CommunityService service;
	
	@RequestMapping(value="/community/insert", method=RequestMethod.GET)
	public String insertForm() {
		return "community/insert";
	}
	
	@RequestMapping(value="/community/insert", method=RequestMethod.POST)
	public String insert(CommunityVo vo, Model model) {
		int n=service.insert(vo);
		if(n>0) {
			model.addAttribute("code","success");
		}else {
			model.addAttribute("code","fail");
		}
		return "redirect:/community/list";
	}
}
