package gg.hta.lol.controller.match;

import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import gg.hta.lol.service.RatingService;
import gg.hta.lol.service.match.SearchService;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;
import lombok.Setter;


@Controller
@RequestMapping("/match/*")
public class SearchController {
	
	@Setter(onMethod_ = @Autowired)
	private SearchService searchService;
	
	@Setter(onMethod_ = @Autowired)
	private RatingService ratingService;
	
	@GetMapping("/search")
	public String search(String sName,Model model) {
		
		SearchVo svo = searchService.getSummoner(sName);
//		svo.getQiList().sort(Comparator.comparing(QueueInfoVo::getQueueType));
		
		model.addAttribute("svo",svo);
		
		model.addAttribute("rating", ratingService.getRatingAvg(sName));

//		searchService.readMatchList(svo.getAccountId(), 0, 20);
		
		List<MostChampVo> mlist = searchService.getMost(sName);
		
		mlist.stream().forEach(item -> {
			if(item.getName().length()>5) {
				int diff = item.getName().length()-(item.getName().length()-5);
				item.setName(item.getName().substring(0, diff).concat("..."));
			}
		});
		
		model.addAttribute("most", mlist);
		
//		model.addAttribute("matchs",searchService.getMatchList(sName));
		
		return ".header2.match.sinfo";
	}
}
