package gg.hta.lol.controller.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.vo.CommunityVo;

@Controller
public class DetailController {
	@Autowired private CommunityService service;
	
	@GetMapping("/community/detail")
	public ModelAndView detail(int pNum) {
		ModelAndView mv=new ModelAndView("community/detail");
		service.hit(pNum);
		
		CommunityVo vo=service.select(pNum);
		CommunityVo prev=service.prev(pNum);
		CommunityVo next=service.next(pNum);
			
		String content=vo.getContent();
		content=content.replaceAll("\n","<br>");
		vo.setContent(content);
		
		mv.addObject("vo",vo);
		mv.addObject("prev",prev);
		mv.addObject("next",next);
		
		return mv;
		
	}
}