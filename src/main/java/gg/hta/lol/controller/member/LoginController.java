package gg.hta.lol.controller.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import gg.hta.lol.service.MemberService;

@Controller
public class LoginController {
	@Autowired private MemberService service;
	@GetMapping("/member/login")
	public String login() {
		return ".header2.member.login";
	}
	@GetMapping("/member/id")
	public String id() {
		return ".header2.member.idSearch";
	}
	@GetMapping("/member/pwd")
	public String pwd() {
		return ".header2.member.pwdSearch";
	}
	@PostMapping("/member/pwdChange")
	public String change(String username, String password) {
		int n = service.updatePwd(username, password);
		if(n>0) {
			return ".header2.member.login";
		}else {
			return ".header2.member.error";
		}
	}
}
