package gg.hta.lol.controller.member;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginSearchController {
	@GetMapping("/member/id")
	public String id() {
		return "member/idSearch";
	}
	@GetMapping("/member/pwd")
	public String pwd() {
		return "member/pwdSearch";
	}
}
