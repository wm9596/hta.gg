package gg.hta.lol.controller.match;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import gg.hta.lol.dao.RatingDao;
import gg.hta.lol.joinvo.MatchMoreJoinVo;
import gg.hta.lol.mapper.RatingMapper;
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
	private RatingService rService;
	
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
	final String NICKNAME = "GGGori";
	final String MATCHID = "4995801953";
	final String cdnVersion = "11.3.1";
	
	// 소환사 평가 추가
	@ResponseBody
	@GetMapping("/insertRating")
	public HashMap<String, Object> insertRating(Model model, double rate, HttpServletResponse res, HttpServletRequest req) {
		
		rate = Math.round(rate*10)/10.0;
		
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("ratingAvg", rtService.getRatingAvg(NICKNAME));
		resultMap.put("ratingCnt", rService.getRatingCnt(NICKNAME));
		
		String nick = "";
		try {
			nick = URLEncoder.encode(NICKNAME, "utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		Cookie[] cook = req.getCookies();
		Boolean b = false;
		
		for (Cookie c : cook) {
			if (c.getName().equals(nick)) {
				b = true;
			}
		}
		
		if (b) {
			resultMap.put("msg", "err");
		} else {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("snickname", NICKNAME);
			map.put("rate", rate);
			rService.addRating(map);
			
			Cookie cookie = new Cookie(nick, "true");
			cookie.setMaxAge(60*60*24*30);
			res.addCookie(cookie);
		}

		
		return resultMap;
	}
	
	@GetMapping("/matchMore")
	public String matchMore(String nickname,String matchId,Model model) {
		
		model.addAttribute("cdn", cdnVersion);
		
		// 소환사 정보
		model.addAttribute("sm", smService.getSummoner(nickname));
		
		// 타입별 티어
		List<QueueInfoVo> vo = qiService.getQueueInfo(nickname);
		
		for (QueueInfoVo v : vo) {
			if (v.getQueueType().equals("RANKED_SOLO_5x5")) {
				model.addAttribute("solo", v);
			} else {
				model.addAttribute("flex", v);
			}
		}
		
		//소환사 평가
		model.addAttribute("rt", rtService.getRatingAvg(nickname));
		model.addAttribute("ratingCnt", rService.getRatingCnt(nickname));
		
		// 해당게임 타입 얻어오기
		String matchType = matchInfoService.getMatchType(matchId);
		
		// 해당게임 모든정보 얻어오기
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("matchid", matchId);
		map.put("type", matchType);
		List<MatchMoreJoinVo> matchMoreJoinList = matchMoreJoinService.getMatchInfoList(map);
		
		String homeTeamTierAvg = "";
		String awayTeamTierAvg = "";
		
		List<Integer> homeTeamMemberKill = new ArrayList<Integer>();
		List<Integer> homeTeamMemberAssist = new ArrayList<Integer>();
		List<Integer> homeTeamMemberDeath = new ArrayList<Integer>();
		List<Integer> awayTeamMemberKill = new ArrayList<Integer>();
		List<Integer> awayTeamMemberAssist = new ArrayList<Integer>();
		List<Integer> awayTeamMemberDeath = new ArrayList<Integer>();
		
		List<Double> homeTeamMemberKda = new ArrayList<Double>();
		List<Double> awayTeamMemberKda = new ArrayList<Double>();
		
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
		
		HashMap<String, String> spell = new HashMap<String, String>();
		HashMap<String, String> rune = new HashMap<String, String>();
		
		spell.put("21", "SummonerBarrier");
		spell.put("1", "SummonerBoost");
		spell.put("14", "SummonerDot");
		spell.put("3", "SummonerExhaust");
		spell.put("4", "SummonerFlash");
		spell.put("6", "SummonerHaste");
		spell.put("7", "SummonerHeal");
		spell.put("13", "SummonerMana");
		spell.put("30", "SummonerPoroRecall");
		spell.put("31", "SummonerPoroThrow");
		spell.put("11", "SummonerSmite");
		spell.put("39", "SummonerSnowURFSnowball_Mark");
		spell.put("32", "SummonerSnowball");
		spell.put("12", "SummonerTeleport");
		spell.put("1", "SummonerBoost");
		
		rune.put("8100", "7200_Domination");
		rune.put("8300", "7203_Whimsy");
		rune.put("8000", "7201_Precision");
		rune.put("8400", "7204_Resolve");
		rune.put("8200", "7202_Sorcery");
		
		List<HashMap<String, Object>> homeTeamMemberSpellRune = new ArrayList<HashMap<String,Object>>();
		List<HashMap<String, Object>> awayTeamMemberSpellRune = new ArrayList<HashMap<String,Object>>();
		
		List<Integer> homeTeamMemberCs = new ArrayList<Integer>();
		List<Integer> awayTeamMemberCs = new ArrayList<Integer>();
		int homeTeamCs = 0;
		int awayTeamCs = 0;
		
		List<Integer> homeTeamMemberDoDmg = new ArrayList<Integer>();
		List<Integer> awayTeamMemberDoDmg = new ArrayList<Integer>();
		int homeTeamDoDmg = 0;
		int awayTeamDoDmg = 0;
		
		List<Integer> homeTeamMemberTakenDmg = new ArrayList<Integer>();
		List<Integer> awayTeamMemberTakenDmg = new ArrayList<Integer>();
		int homeTeamTakenDmg = 0;
		int awayTeamTakenDmg = 0;
		
		List<Integer> homeTeamMemberGold = new ArrayList<Integer>();
		List<Integer> awayTeamMemberGold = new ArrayList<Integer>();
		int homeTeamGold = 0;
		int awayTeamGold = 0;
		
		List<Integer> homeTeamMemberLevel = new ArrayList<Integer>();
		List<Integer> awayTeamMemberLevel = new ArrayList<Integer>();
		
		List<Integer> homeTeamMemberWardInstall = new ArrayList<Integer>();
		List<Integer> awayTeamMemberWardInstall = new ArrayList<Integer>();
		int homeTeamWardInstall = 0;
		int awayTeamWardInstall = 0;
		
		List<Integer> homeTeamMemberWardRemove = new ArrayList<Integer>();
		List<Integer> awayTeamMemberWardRemove = new ArrayList<Integer>();
		int homeTeamWardRemove = 0;
		int awayTeamWardRemove = 0;
		
		String homeTeamWinLose = "";
		String awayTeamWinLose = "";
		
		HashMap<String, Object> homeTeamObject = new HashMap<String, Object>();
		HashMap<String, Object> awayTeamObject = new HashMap<String, Object>();
		
		int loopCnt = 0;
		for (MatchMoreJoinVo Vo : matchMoreJoinList) {
			
			// 팀원 챔피언 초상화 받아오기
			String championPicture = championService.getChampionPicture(Vo.getChampionId());
			// 팀원 아이템 리스트 받아오기
			int[] itemList = {Vo.getItem1(), Vo.getItem2(), Vo.getItem3(), Vo.getItem4(), Vo.getItem5(), Vo.getItem6(), Vo.getAccessory()};
			// 팀원 룬, 스펠 받아오기
			String spell1 = spell.get(Vo.getSpell1() + "");
			String spell2 = spell.get(Vo.getSpell2() + "");
			String rune1 = rune.get(Vo.getRune1() + "");
			String rune2 = rune.get(Vo.getRune2() + "");
			
			// 팀 승패여부 받아오기
			HashMap<String, String> tierMap = new HashMap<String, String>();
			tierMap.put("queuetype", matchType);
			
			if (Vo.getTeamId().equals("100")) {
				// 팀 티어 받아오기
				tierMap.put("snickname", Vo.getSnickname());
				homeTeamTierList.add(qiService.getTier(tierMap));
				// 팀원 KDA 받아오기
				homeTeamMemberKill.add(Vo.getKill());
				homeTeamMemberAssist.add(Vo.getAssist());
				homeTeamMemberDeath.add(Vo.getDeath());
				
				homeTeamMemberKda.add(getKda(Vo.getKill(), Vo.getAssist(), Vo.getDeath()));
				// 팀 KDA 받아오기
				homeTeamKill += Vo.getKill();
				homeTeamAssist += Vo.getAssist();
				homeTeamDeath += Vo.getDeath();
				
				// 팀원 닉네임 리스트
				homeTeamNicknameList.add(Vo.getSnickname());
				
				// 팀원 챔피언 초상화 리스트
				homeTeamChampIconList.add(championPicture);
				// 팀원 스펠, 룬 리스트
				homeTeamMemberSpellRune.add(new HashMap<String, Object>() {{
					put("spell1", spell1);
					put("spell2", spell2);
					put("rune1", rune1);
					put("rune2", rune2);
				}});
				
				// 팀원 아이템리스트
				homeTeamItemList.add(itemList);
				
				// 팀 CS
				homeTeamMemberCs.add(Vo.getCs());
				homeTeamCs += Vo.getCs();
				
				// 팀 준 데미지
				homeTeamMemberDoDmg.add(Vo.getChampionDamage());
				homeTeamDoDmg += Vo.getChampionDamage();
				
				// 받은 데미지
				homeTeamMemberTakenDmg.add(Vo.getTakenDamage());
				homeTeamTakenDmg += Vo.getTakenDamage();
				
				// 골드
				homeTeamMemberGold.add(Vo.getGold());
				homeTeamGold += Vo.getGold();
				
				// 레벨
				homeTeamMemberLevel.add(Vo.getChampionLevel());
				
				// 와드설치
				homeTeamMemberWardInstall.add(Vo.getWardInstall());
				homeTeamWardInstall += Vo.getWardInstall();
				
				// 와드제거
				homeTeamMemberWardRemove.add(Vo.getWardRemove());
				homeTeamWardRemove += Vo.getWardRemove();
				
				// 승패여부
				homeTeamWinLose = Vo.getWinlose();
				
				// 오브젝트
				homeTeamObject.put("dragon", Vo.getDragonKill());
				homeTeamObject.put("baron", Vo.getBaronKill());
				homeTeamObject.put("tower", Vo.getTowerKill());
			
			} else {
				tierMap.put("snickname", Vo.getSnickname());
				awayTeamTierList.add(qiService.getTier(tierMap));
				
				awayTeamMemberKill.add(Vo.getKill());
				awayTeamMemberAssist.add(Vo.getAssist());
				awayTeamMemberDeath.add(Vo.getDeath());
				
				awayTeamMemberKda.add(getKda(Vo.getKill(), Vo.getAssist(), Vo.getDeath()));
				
				awayTeamKill += Vo.getKill();
				awayTeamAssist += Vo.getAssist();
				awayTeamDeath += Vo.getDeath();
				
				awayTeamNicknameList.add(Vo.getSnickname());
				
				awayTeamChampIconList.add(championPicture);
				
				awayTeamMemberSpellRune.add(new HashMap<String, Object>() {{
					put("spell1", spell1);
					put("spell2", spell2);
					put("rune1", rune1);
					put("rune2", rune2);
				}});
				
				awayTeamItemList.add(itemList);
				
				awayTeamMemberCs.add(Vo.getCs());
				awayTeamCs += Vo.getCs();
				
				awayTeamMemberDoDmg.add(Vo.getChampionDamage());
				awayTeamDoDmg += Vo.getChampionDamage();
				
				awayTeamMemberTakenDmg.add(Vo.getChampionDamage());
				awayTeamTakenDmg += Vo.getChampionDamage();
				
				awayTeamMemberGold.add(Vo.getGold());
				awayTeamGold += Vo.getGold();
				awayTeamMemberLevel.add(Vo.getChampionLevel());
				
				awayTeamMemberWardInstall.add(Vo.getWardInstall());
				awayTeamWardInstall += Vo.getWardInstall();
				
				awayTeamMemberWardRemove.add(Vo.getWardRemove());
				awayTeamWardRemove += Vo.getWardRemove();
				
				awayTeamWinLose = Vo.getWinlose();
				
				awayTeamObject.put("dragon", Vo.getDragonKill());
				awayTeamObject.put("baron", Vo.getBaronKill());
				awayTeamObject.put("tower", Vo.getTowerKill());
			}
			
			
		}
		
		// 각팀 티어
		model.addAttribute("homeTeamTierList", homeTeamTierList);
		model.addAttribute("awayTeamTierList", awayTeamTierList);
		
		// 각팀 평균티어
		homeTeamTierAvg = getTierAvg(homeTeamTierList);
		awayTeamTierAvg = getTierAvg(awayTeamTierList);
		model.addAttribute("homeTeamTierAvg", homeTeamTierAvg);
		model.addAttribute("awayTeamTierAvg", awayTeamTierAvg);
		
		// 팀원 KDA
		model.addAttribute("homeTeamMemberKill", homeTeamMemberKill);
		model.addAttribute("homeTeamMemberAssist", homeTeamMemberAssist);
		model.addAttribute("homeTeamMemberDeath", homeTeamMemberDeath);
		model.addAttribute("homeTeamMemberKda", homeTeamMemberKda);
		
		model.addAttribute("awayTeamMemberKill", awayTeamMemberKill);
		model.addAttribute("awayTeamMemberAssist", awayTeamMemberAssist);
		model.addAttribute("awayTeamMemberDeath", awayTeamMemberDeath);
		model.addAttribute("awayTeamMemberKda", awayTeamMemberKda);
		
		// 각팀 KDA
		homeTeamKdaAvg = getKda(homeTeamKill, homeTeamAssist, homeTeamDeath);
		awayTeamKdaAvg = getKda(awayTeamKill, awayTeamAssist, homeTeamDeath);
		
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
		
		// 팀원 스펠, 룬
		model.addAttribute("homeTeamMemberSpellRune", homeTeamMemberSpellRune);
		model.addAttribute("awayTeamMemberSpellRune", awayTeamMemberSpellRune);
		
		// 팀원 아이템 리스트
		model.addAttribute("homeTeamItemList", homeTeamItemList);
		model.addAttribute("awayTeamItemList", awayTeamItemList);
		
		// 팀 Cs
		model.addAttribute("homeTeamCs", homeTeamCs);
		model.addAttribute("awayTeamCs", awayTeamCs);
		// 팀원 CS
		model.addAttribute("homeTeamMemberCs", homeTeamMemberCs);
		model.addAttribute("awayTeamMemberCs", awayTeamMemberCs);
		
		// 팀 가한 데미지
		model.addAttribute("homeTeamDoDmg", homeTeamDoDmg);
		model.addAttribute("awayTeamDoDmg", awayTeamDoDmg);
		// 팀원 가한 데미지
		model.addAttribute("homeTeamMemberDoDmg", homeTeamMemberDoDmg);
		model.addAttribute("awayTeamMemberDoDmg", awayTeamMemberDoDmg);
		
		// 팀 받은 데미지
		model.addAttribute("homeTeamTakenDmg", homeTeamTakenDmg);
		model.addAttribute("awayTeamTakenDmg", awayTeamTakenDmg);
		// 팀원 받은 데미지
		model.addAttribute("homeTeamMemberTakenDmg", homeTeamMemberTakenDmg);
		model.addAttribute("awayTeamMemberTakenDmg", awayTeamMemberTakenDmg);
		
		// 팀 골드
		model.addAttribute("homeTeamGold", homeTeamGold);
		model.addAttribute("awayTeamGold", awayTeamGold);
		
		// 팀원 골드
		model.addAttribute("homeTeamMemberGold", homeTeamMemberGold);
		model.addAttribute("awayTeamMemberGold", awayTeamMemberGold);
		
		// 팀원 레벨
		model.addAttribute("homeTeamMemberLevel", homeTeamMemberLevel);
		model.addAttribute("awayTeamMemberLevel", awayTeamMemberLevel);
		
		// 팀 와드설치
		model.addAttribute("homeTeamWardInstall", homeTeamWardInstall);
		model.addAttribute("awayTeamWardInstall", awayTeamWardInstall);
		
		// 팀원 와드설치
		model.addAttribute("homeTeamMemberWardInstall", homeTeamMemberWardInstall);
		model.addAttribute("awayTeamMemberWardInstall", awayTeamMemberWardInstall);
		
		// 팀 와드제거
		model.addAttribute("homeTeamWardRemove", homeTeamWardRemove);
		model.addAttribute("awayTeamWardRemove", awayTeamWardRemove);
		
		// 팀원 와드제거
		model.addAttribute("homeTeamMemberWardRemove", homeTeamMemberWardRemove);
		model.addAttribute("awayTeamMemberWardRemove", awayTeamMemberWardRemove);
		
		// 팀 승패
		model.addAttribute("homeTeamWinLose", homeTeamWinLose);
		model.addAttribute("awayTeamWinLose", awayTeamWinLose);
		
		// 오브젝트
		model.addAttribute("homeTeamObject", homeTeamObject);
		model.addAttribute("awayTeamObject", awayTeamObject);
		
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
		tierMap.put("unranked", "0");
		
		int memberCnt = 0;
		
		for (String t : tierList) {
			try {
				String tier = t.split("_")[0];
				String tmp = (String) tierMap.get(tier);
				tierAvgCnt += Integer.parseInt(tmp);
				memberCnt++;
			} catch (NullPointerException e) {
				tierAvgCnt += 0;
			}
		}
		
		if (memberCnt != 0) {
			tierAvgCnt /= memberCnt;
		}
		
		for (String o : tierMap.keySet()) {
			if (tierMap.get(o).equals(Integer.toString(tierAvgCnt))) {	
				tierAvg = o;
			}
		}
		return tierAvg;
	}
	
	public double getKda(int kill, int assist, int death) {
		double kda = (double)(kill + assist) / death * 1.0;
		kda = (double)Math.round(kda*10)/10;
		return kda;
	}
}
