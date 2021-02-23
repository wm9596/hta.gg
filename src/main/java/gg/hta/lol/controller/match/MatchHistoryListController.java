package gg.hta.lol.controller.match;

import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.sun.istack.Nullable;

import gg.hta.lol.riotapi.RuneSpellConverter;
import gg.hta.lol.service.match.MatchListService;
import gg.hta.lol.vo.match.MatchListVo;
import gg.hta.lol.vo.match.MatchMostVo;
import gg.hta.lol.vo.match.MostChampVo;

@RestController
public class MatchHistoryListController {

	@Autowired
	private MatchListService service;
	@Autowired
	private RuneSpellConverter rsConverter;

	@RequestMapping(value = {"/match/getList/{name}/{type}","/match/getList/{name}"}, produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	private MatchMostVo MatchList(@PathVariable("name")String name, @PathVariable(name = "type",required = false) String type) {
		
		List<MatchListVo> list = null;
		list = service.getMatchList(name, type);
		
		HashMap<String, MostChampVo> cmap = new HashMap<String, MostChampVo>();
		
		list.stream().forEach(item->{
//			System.out.println(item.getMatchid());
			item.setSpell1(rsConverter.convertSpell(item.getSpell1()));
			item.setSpell2(rsConverter.convertSpell(item.getSpell2()));
			item.setRune1(rsConverter.convertRune(item.getRune1()));
			item.setRune2(rsConverter.convertRune(item.getRune2()));
			
			MostChampVo vo = cmap.getOrDefault(item.getName(), new MostChampVo(
						item.getName(),
						item.getPicture(),
						0,
						0,
						0,
						0,
						0,
						0
					));
			
			vo.setKill(vo.getKill()+item.getKill());
			vo.setAssist(vo.getAssist()+item.getAssist());
			vo.setDeath(vo.getDeath() + item.getDeath());
			vo.setCs(vo.getCs()+item.getCs());
			vo.setCnt(vo.getCnt()+1);
			
			if(item.getWinlose().equals("Win")) {
				vo.setWincnt(vo.getWincnt()+1);
			}
			
			cmap.put(item.getName(),vo);
		});
		
		List<MostChampVo> mlist;
		
		mlist = cmap.values().stream().sorted((a,b)->Integer.compare(b.getCnt(), a.getCnt())).limit(3).collect(Collectors.toList());
		
		MatchMostVo dto = new MatchMostVo(list,mlist);
		
		return dto;
	}
}
