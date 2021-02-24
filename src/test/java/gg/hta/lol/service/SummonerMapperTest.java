package gg.hta.lol.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import gg.hta.lol.mapper.ChampionMapper;
import gg.hta.lol.mapper.MatchInfoMapper;
import gg.hta.lol.mapper.SummonerMapper;
import gg.hta.lol.service.match.SearchService;
import gg.hta.lol.vo.match.MatchListVo;
import gg.hta.lol.vo.match.ParticipantsVo;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = { "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security_config.xml",
		"file:src/main/webapp/WEB-INF/spring/email/email-config.xml" })
@Setter
public class SummonerMapperTest {

	@Autowired
	private ChampionMapper mapper;
//	private MatchInfoMapper mapper;

//	@Test
//	public void getSummonerTest() {
//		System.out.println(mapper.getSummonerInfo("더덕순대국"));
//	}
	@Test
	public void getSummonerTest() {
		List<String> list =new ArrayList<String>();
		list.add("4923998077");
		
		mapper.updateWin(list);
	}

//	@Test
//	public void getMostTest() {
//		List<MatchListVo> list = mapper.getMatchInfoList("더덕순대국");
//		List<String> slist = list.stream().map(MatchListVo::getMatchid).collect(Collectors.toList());
////		System.out.println(slist);
//		List<ParticipantsVo> plist = mapper.getParticipants(slist);
////		System.out.println(plist);
//		for (MatchListVo vo : list) {
//			vo.setFriendly(plist.stream().filter(item -> {
//				return item.getMatchid().equals(vo.getMatchid()) && item.getTeamid().equals(vo.getTeamid());
//			}).collect(Collectors.toList()));
//			vo.setEnemy(plist.stream().filter(item -> {
//				return item.getMatchid().equals(vo.getMatchid()) && !item.getTeamid().equals(vo.getTeamid());
//			}).collect(Collectors.toList()));
//
//		}
//
//	}

}
