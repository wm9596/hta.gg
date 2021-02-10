package gg.hta.lol.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import gg.hta.lol.service.MemberService;
import gg.hta.lol.vo.MemberVo;

@Controller
public class MemberController {
	@Autowired private MemberService service;

	@RequestMapping(value="/member/join", method = RequestMethod.GET)
	public String joinForm() {
		return ".header2.member.join";
	}
	
	@RequestMapping(value="/member/join", method = RequestMethod.POST)
	public String join(MemberVo vo) {
		int n = service.insert(vo);
		if(n>0) {
			return ".header2.member.login";
		}else {
			return ".header2.member.error";
		}
	}
	
	@GetMapping("/member/all/main")
	public String all() {
		return ".header2.member.all.main";
	}
	@GetMapping("/member/member/main")
	public String member() {
		return ".header2.member.member.main";
	}
	@GetMapping("/member/admin/main")
	public String admin() {
		return ".header2.member.admin.main";
	}
}
