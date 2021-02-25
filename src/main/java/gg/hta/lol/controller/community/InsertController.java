package gg.hta.lol.controller.community;

import java.security.Principal;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gg.hta.lol.service.CommunityService;
import gg.hta.lol.service.PointService;
import gg.hta.lol.vo.CommunityVo;
import gg.hta.lol.vo.PointVo;

@Controller
public class InsertController {
	@Autowired private CommunityService service;
	@Autowired private PointService pointService;
	
	@RequestMapping(value="/community/insert", method=RequestMethod.GET)
	public String insertForm(int cNum, Model model) {
		model.addAttribute("cNum",cNum);
		return ".header2.community.insert";
	}
	
	@RequestMapping(value="/community/insert", method=RequestMethod.POST)
	public String insert(CommunityVo vo, Model model, Principal principal) {
		int n=service.insert(vo);
		pointService.insert(new PointVo(0, principal.getName(), "게시글 등록", +150, null));
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("username", principal.getName());
		map.put("score", +150);
		pointService.update(map);
		if(n>0) {
			model.addAttribute("code","success");
		}else {
			model.addAttribute("code","fail");
		}
		return "redirect:/community/list";
	}
}