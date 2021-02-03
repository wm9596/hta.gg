package gg.hta.lol.controller.match;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchMoreController {
	@GetMapping("/matchMore")
	public String matchMore() {
		return ".header2.match.matchMore";
	}
}
