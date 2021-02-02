package gg.hta.lol.controller.match;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class SearchController {

	final private String url = "https://kr.api.riotgames.com/";
	
	@GetMapping("/search")
	public String search(String sName) {
		
		System.out.println(sName);
		
		return "match/sinfo";
	}
}
