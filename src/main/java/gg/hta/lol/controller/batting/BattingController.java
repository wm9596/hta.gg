package gg.hta.lol.controller.batting;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BattingController {

	@GetMapping(value="/batting/home")
	public String battingHome() {
		return "batting/home";
	}
}
