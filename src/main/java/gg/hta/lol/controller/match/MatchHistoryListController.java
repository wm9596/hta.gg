package gg.hta.lol.controller.match;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sun.istack.Nullable;

import gg.hta.lol.riotapi.GameType;
import gg.hta.lol.riotapi.RuneSpellConverter;
import gg.hta.lol.service.MatchInfoService;
import gg.hta.lol.service.match.MatchListService;
import gg.hta.lol.vo.match.MatchListVo;

@RestController
public class MatchHistoryListController {

	@Autowired
	private MatchListService service;
	@Autowired
	private RuneSpellConverter rsConverter;

	@RequestMapping(value = "/match/getList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	private List<MatchListVo> MatchList(String name, @Nullable String type) {
		List<MatchListVo> list = null;
		list = service.getMatchList(name, type);
		
		list.stream().forEach(item->{
			item.setSpell1(rsConverter.convertSpell(item.getSpell1()));
			item.setSpell2(rsConverter.convertSpell(item.getSpell2()));
			item.setRune1(rsConverter.convertRune(item.getRune1()));
			item.setRune2(rsConverter.convertRune(item.getRune2()));
			
		});
		
		return list;
	}
}
