package gg.hta.lol.community.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gg.hta.lol.community.service.CommunityService;
import gg.hta.lol.vo.CommunityVo;

@Controller
public class UpdateController {
	@Autowired private CommunityService service;
	
	@GetMapping(value="/community/update")
	public String updateForm(int num,Model model) {
		CommunityVo vo=service.select(num);
		model.addAttribute("vo",vo);
		return "update";
	}
	@PostMapping(value="/community/update")
	public String update(CommunityVo vo,Model model) {
		try {
			service.update(vo);
			model.addAttribute("code","success");
		}catch(Exception e) {
			e.printStackTrace();
			model.addAttribute("code","fail");
		}
		return "result";
	}
}