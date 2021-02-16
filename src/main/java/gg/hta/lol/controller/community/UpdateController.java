package gg.hta.lol.controller.community;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.vo.CommunityVo;

@Controller
public class UpdateController {
	@Autowired private CommunityService service;
	
	@GetMapping(value="/community/update")
	public String updateForm(int pNum,int cNum,Model model) {
		CommunityVo vo=service.select(pNum);
		CommunityVo vo1=service.select(cNum);
		model.addAttribute("vo",vo);
		model.addAttribute("vo1",vo1);
		return ".header.community.update";
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
		return "redirect:/community/list";
	}
}