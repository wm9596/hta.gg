package gg.hta.lol.controller.match;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import gg.hta.lol.service.RatingService;
import gg.hta.lol.service.match.SearchService;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;
import lombok.Setter;


@Controller
public class SearchController {
	
	@Setter(onMethod_ = @Autowired)
	private SearchService searchService;
	
	@Setter(onMethod_ = @Autowired)
	private RatingService ratingService;
	
	@GetMapping("/match/search")
	public String search(String sName,Model model,HttpServletRequest request ,RedirectAttributes redirectAttributes) {

		SearchVo svo = searchService.getSummoner(sName);
		
		if(svo == null) {
			System.out.println("소환사 정보 없음");
			redirectAttributes.addFlashAttribute("isError",true);
		    return "redirect:"+request.getHeader("Referer");
		}else {
			model.addAttribute("svo",svo);
			
			model.addAttribute("rating", ratingService.getRatingAvg(sName));

			searchService.readMatchList(svo.getAccountId(), 0, 3);
			
			List<MostChampVo> mlist = searchService.getMost(sName);
			
			mlist.stream().forEach(item -> {
				if(item.getName().length()>5) {
					int diff = item.getName().length()-(item.getName().length()-5);
					item.setName(item.getName().substring(0, diff).concat("..."));
				}
			});
			
			model.addAttribute("most", mlist);
			
			return ".header2.match.sinfo";
		}
	}
}
