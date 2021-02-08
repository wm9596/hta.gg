package gg.hta.lol.controller.match;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import gg.hta.lol.joinvo.MatchMoreJoinVo;
import gg.hta.lol.service.ChampionService;
import gg.hta.lol.service.MatchInfoService;
import gg.hta.lol.service.MatchMoreJoinService;
import gg.hta.lol.service.QueueInfoService;
import gg.hta.lol.service.RatingService;
import gg.hta.lol.service.SummonerService;
import gg.hta.lol.vo.QueueInfoVo;

@Controller
public class MatchMoreController {
	
	@Autowired
	private SummonerService smService;
	@Autowired
	private QueueInfoService qiService;
	@Autowired
	private RatingService rtService;
	@Autowired
	private MatchInfoService matchInfoService;
	@Autowired
	private MatchMoreJoinService matchMoreJoinService;
	@Autowired
	private ChampionService championService;
	
	// test
	final String NICKNAME = "댕청잇";
	final String MATCHID = "4973355155";
	
	@GetMapping("/matchMore")
	public String matchMore(Model model) {
		
		// 소환사 정보
		model.addAttribute("sm", smService.getSummoner(NICKNAME));
		
		// 타입별 티어
		List<QueueInfoVo> vo = qiService.getQueueInfo(NICKNAME);
		
		for (QueueInfoVo v : vo) {
			if (v.getQueueType().equals("RANKED_SOLO_5x5")) {
				model.addAttribute("solo", v);
			} else {
				model.addAttribute("flex", v);
			}
		}
		
		//소환사 평가
		model.addAttribute("rt", rtService.getRatingAvg(NICKNAME));
		
		// 해당게임 타입 얻어오기
		String matchType = matchInfoService.getMatchType(MATCHID);
		
		// 해당게임 모든정보 얻어오기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("matchid", MATCHID);
		map.put("type", matchType);
		List<MatchMoreJoinVo> matchMoreJoinList = matchMoreJoinService.getMatchInfoList(map);
		
		String homeTeamTierAvg = "";
		String awayTeamTierAvg = "";
		
		int homeTeamKill = 0;
		int homeTeamAssist = 0;
		int homeTeamDeath = 0;
		int awayTeamKill = 0;
		int awayTeamAssist = 0;
		int awayTeamDeath = 0;
		
		double homeTeamKdaAvg = 0;
		double awayTeamKdaAvg = 0;
		
		List<String> homeTeamTierList = new ArrayList<String>();
		List<String> awayTeamTierList = new ArrayList<String>();
		List<String> homeTeamNicknameList = new ArrayList<String>();
		List<String> awayTeamNicknameList = new ArrayList<String>();
		List<String> homeTeamChampIconList = new ArrayList<String>();
		List<String> awayTeamChampIconList = new ArrayList<String>();
		List<int[]> homeTeamItemList = new ArrayList<int[]>();
		List<int[]> awayTeamItemList = new ArrayList<int[]>();
		
		for (MatchMoreJoinVo Vo : matchMoreJoinList) {
			
			// 팀원 챔피언 초상화 받아오기
			String championPicture = championService.getChampionPicture(Vo.getChampionId());
			// 팀원 아이템 리스트 받아오기
			int[] itemList = {Vo.getItem1(), Vo.getItem2(), Vo.getItem3(), Vo.getItem4(), Vo.getItem5(), Vo.getItem6(), Vo.getAccessory()};
			
			if (Vo.getTeamId().equals("100")) {
				// 팀 티어 받아오기
				homeTeamTierList.add(Vo.getTier());
				// 팀 KDA 받아오기
				homeTeamKill += Vo.getKill();
				homeTeamAssist += Vo.getAssist();
				homeTeamDeath += Vo.getDeath();
				// 팀원 닉네임 받아오기
				homeTeamNicknameList.add(Vo.getSnickname());
				
				// 팀원 챔피언 초상화 배열에 추가
				homeTeamChampIconList.add(championPicture);
				
				// 팀원 아이템리스트
				homeTeamItemList.add(itemList);
			
			} else {
				awayTeamTierList.add(Vo.getTier());
				
				awayTeamKill += Vo.getKill();
				awayTeamAssist += Vo.getAssist();
				awayTeamDeath += Vo.getDeath();
				
				awayTeamNicknameList.add(Vo.getSnickname());
				
				awayTeamChampIconList.add(championPicture);
				
				awayTeamItemList.add(itemList);
			}
			
			
		}
		
		// 각팀 평균티어
		homeTeamTierAvg = getTierAvg(homeTeamTierList);
		awayTeamTierAvg = getTierAvg(awayTeamTierList);
		model.addAttribute("homeTeamTierAvg", homeTeamTierAvg);
		model.addAttribute("awayTeamTierAvg", awayTeamTierAvg);
		
		// 각팀 KDA
		
		homeTeamKdaAvg = (double)(homeTeamKill + homeTeamAssist) / homeTeamDeath * 1.0;
		awayTeamKdaAvg = (double)(awayTeamKill + awayTeamAssist) / awayTeamDeath * 1.0;
		homeTeamKdaAvg = (double)Math.round(homeTeamKdaAvg*10)/10;
		awayTeamKdaAvg = (double)Math.round(awayTeamKdaAvg*10)/10;
		
		model.addAttribute("homeTeamKill", homeTeamKill);
		model.addAttribute("homeTeamAssist", homeTeamAssist);
		model.addAttribute("homeTeamDeath", homeTeamDeath);
		
		model.addAttribute("awayTeamKill", awayTeamKill);
		model.addAttribute("awayTeamAssist", awayTeamAssist);
		model.addAttribute("awayTeamDeath", awayTeamDeath);
		
		model.addAttribute("homeTeamKdaAvg", homeTeamKdaAvg);
		model.addAttribute("awayTeamKdaAvg", awayTeamKdaAvg);
		
		// 각팀 닉네임
		model.addAttribute("homeTeamNicknameList", homeTeamNicknameList);
		model.addAttribute("awayTeamNicknameList", awayTeamNicknameList);
		
		// 팀원 챔피언 초상화
		model.addAttribute("homeTeamChampIconList", homeTeamChampIconList);
		model.addAttribute("awayTeamChampIconList", awayTeamChampIconList);
		
		// 팀원 아이템 리스트
		model.addAttribute("homeTeamItemList", homeTeamItemList);
		model.addAttribute("awayTeamItemList", awayTeamItemList);
		
		
		return ".header2.match.matchMore";
	}
	
	
	// 평균티어 구하기
	public String getTierAvg(List<String> tierList) {
		
		int tierAvgCnt = 0;
		String tierAvg = "";
		HashMap<String, Object> tierMap = new HashMap<String, Object>();
		tierMap.put("CHALLENGER", "9");
		tierMap.put("GRANDMASTER", "8");
		tierMap.put("MASTER", "7");
		tierMap.put("DIAMOND", "6");
		tierMap.put("PLATINUM", "5");
		tierMap.put("GOLD", "4");
		tierMap.put("SILVER", "3");
		tierMap.put("BRONZE", "2");
		tierMap.put("IRON", "1");
		
		for (String t : tierList) {
			String tier = t.split("_")[0];
			String tmp = (String) tierMap.get(tier);
			tierAvgCnt += Integer.parseInt(tmp);
		}
		
		tierAvgCnt /= 5;
		
		for (String o : tierMap.keySet()) {
			if (tierMap.get(o).equals(Integer.toString(tierAvgCnt))) {	
				tierAvg = o;
			}
		}
		return tierAvg;
	}
}
