package gg.hta.lol.controller.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import gg.hta.lol.service.CommunityService;

@Controller
public class DeleteController {
	@Autowired CommunityService service;
	
	@GetMapping(value="/community/delete")
	public String delete(int pNum) {
		service.delete(pNum);
		return "redirect:/community/list";
	}
}