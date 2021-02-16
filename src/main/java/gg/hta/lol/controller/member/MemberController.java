package gg.hta.lol.controller.member;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	@GetMapping("/member/member/info")
	public String myPage(Principal principal, Model m) {
		MemberVo vo = service.selectOne(principal.getName());
		m.addAttribute("vo", vo);
		return ".mypage.info";
	}
	@PostMapping(value = "/member/update")
	public String update(MemberVo vo, Principal principal, Model m) {
		int n = service.update(vo);
		if(n>0) {
			vo = service.selectOne(principal.getName());
			m.addAttribute("vo", vo);
			return ".mypage.info";
		}else {
			return ".header2.member.error";
		}
	}
	@GetMapping("/member/member/profile")
	public String myPage() {
		return ".mypage.profile";
	}
	@GetMapping(value = "/member/member/delete", produces = {MediaType.APPLICATION_XML_VALUE})
	@ResponseBody
	public String delete(Principal principal) {
		StringBuffer sb = new StringBuffer();
		try {
			service.delete(principal.getName());
			sb.append("<data>");
				sb.append("<result>success</result>");
			sb.append("</data>");
			return sb.toString();
		}catch (Exception e) {
			e.printStackTrace();
			sb.append("<data>");
				sb.append("<result>fail</code>");
			sb.append("</data>");
			return sb.toString();
		}
	}
	@GetMapping("/member/admin/memberList")
	public String adminPage() {
		return ".adminpage.memberList";
	}
}
