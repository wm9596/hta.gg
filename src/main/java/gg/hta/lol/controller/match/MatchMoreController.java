package gg.hta.lol.controller.match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gg.hta.lol.service.QueueInfoService;
import gg.hta.lol.service.SummonerService;

@Controller
public class MatchMoreController {
	
	@Autowired
	private SummonerService smService;
	@Autowired
	private QueueInfoService qiService;
	
	@GetMapping("/matchMore")
	public String matchMore(Model model) {
		model.addAttribute("sm", smService.getSummoner("크림몬"));
		model.addAttribute("qi", qiService.getQueueInfo("크림몬"));
		System.out.println(smService.getSummoner("크림몬"));
		System.out.println(qiService.getQueueInfo("크림몬"));
		return ".header2.match.matchMore";
	}
}
