package gg.hta.lol.service.match;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.Stream;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.sun.mail.imap.protocol.Item;

import gg.hta.lol.mapper.BanListMapper;
import gg.hta.lol.mapper.ChampionMapper;
import gg.hta.lol.mapper.MatchInfoMapper;
import gg.hta.lol.mapper.QueueInfoMapper;
import gg.hta.lol.mapper.SummonerMapper;
import gg.hta.lol.mapper.TeamInfoMapper;
import gg.hta.lol.mapper.TeamMemberInfoMapper;
import gg.hta.lol.riotapi.DataRequester;
import gg.hta.lol.riotapi.GameType;
import gg.hta.lol.vo.BanListVo;
import gg.hta.lol.vo.MatchVo;
import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.TeamInfoVo;
import gg.hta.lol.vo.TeamMemberinfoVo;
import gg.hta.lol.vo.match.MatchInfosWrapper;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;
import gg.hta.lol.vo.match.WinCountVo;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {

    @Autowired
	private DataRequester dataRequester;
	
	@Autowired
	private SummonerMapper summonerMapper;
	
	@Autowired
	private QueueInfoMapper queuemapper;
	
	@Autowired
	private MatchInfoMapper matchinfoMapper;
	
	@Autowired
	private TeamInfoMapper teaminfoMapper;
	
	@Autowired
	private TeamMemberInfoMapper tminfoMapper;
	
	@Autowired
	private ChampionMapper champMapper;
	
	@Autowired
	private BanListMapper banlistMapper;
	
	@Override
	@Transactional
	public void searchSummonerInfo(String name) {
		String sid;
		String aid;
		JsonObject summonerInfo = dataRequester.getSummonerInfo(name);
		
		sid = summonerInfo.get("id").getAsString();
		aid = summonerInfo.get("accountId").getAsString();
		
		addSummoner(
			new SummonerVo(
							name,
							summonerInfo.get("summonerLevel").getAsInt(), 
							summonerInfo.get("profileIconId").getAsString()
							),
			true
				);
		
		addQueueInfo(sid);
		readMatchList(aid,0,20,name);
	}
	
	@Override
	@Transactional
	public SearchVo getSummoner(String name) {
		String sid;
		String aid;
		JsonObject summonerInfo = dataRequester.getSummonerInfo(name);
		
		if(summonerInfo==null) {
			return null;
		}
		
		sid = summonerInfo.get("id").getAsString();
		aid = summonerInfo.get("accountId").getAsString();
		SummonerVo summonerVo = addSummoner(
			new SummonerVo(
							summonerInfo.get("name").getAsString().replaceAll(" ", ""),
							summonerInfo.get("summonerLevel").getAsInt(), 
							summonerInfo.get("profileIconId").getAsString()
							),
			true
				);
	
//		System.out.println(summonerVo);
		
		addQueueInfo(sid);
		
		SearchVo searchVo = new SearchVo();
		
		searchVo.setSummoner(summonerVo);
		searchVo.setAccountId(aid);
		
		searchVo.setQiList(queuemapper.getQueueInfo(name));
		
//		SearchVo vo = summonerMapper.getSummonerInfo(name);
		
//		vo.getQiList().sort(Comparator.comparing(QueueInfoVo::getQueueType));
		
		return searchVo;
	}
	
	/**
	 * isUpdate = 정보가 중복일때 업데이트 시킬지 여부*/
	@Override
	public SummonerVo addSummoner(SummonerVo svo,boolean isUpdate) {
		
		try {
//			System.out.println("소환사 추가");
			summonerMapper.addSummoner(svo);
		}catch (DuplicateKeyException e) {
//			System.out.println("소환사정보 중복 ");
			if(isUpdate) {
//				System.out.println("소환사 정보 수정");
				summonerMapper.updateSummoner(svo);
			}
		}
		return svo;
	}
	
	@Override
	public void addQueueInfo(String sid) {
		JsonArray leagueInfo = dataRequester.getLeagueInfo(sid);
		
		for(int i = 0 ; i< leagueInfo.size() ; i++) {
			JsonObject jo = leagueInfo.get(i).getAsJsonObject();
			
//			System.out.println(jo);
			
			QueueInfoVo qvo = new QueueInfoVo(
					jo.get("summonerName").getAsString().replaceAll(" ", ""),
					jo.get("queueType").getAsString() ,
					jo.get("tier").getAsString()+"_"+jo.get("rank").getAsString(),
					jo.get("leaguePoints").getAsInt(),
					jo.get("wins").getAsInt(), 
					jo.get("losses").getAsInt());
			
			
			try {
//				System.out.println(qvo);
				queuemapper.addQueueInfo(qvo);
			}catch (DuplicateKeyException e) {
//				System.out.println("큐별 티어 정보 중복 정보 수정");
				queuemapper.updateQueueInfo(qvo);
			}
		}
	}
	
	@Override
	@Transactional
	public void readMatchList(String aid,int start,int end,String snickname) {
		
		
		JsonObject matchInfo = dataRequester.getMatchList(aid,0	,20);
//		JsonObject matchInfo = dataRequester.getMatchList(aid);
		
		JsonArray matchArr = matchInfo.get("matches").getAsJsonArray();
		
		Stream<JsonElement> stream = StreamSupport.stream(matchArr.spliterator(), true);
		
		List<MatchInfosWrapper> mlist = new ArrayList<MatchInfosWrapper>();
		
		ThreadGroup group = new ThreadGroup("group");
		
		HashMap<String, Integer> map =  new HashMap<String, Integer>();
		
		stream.filter(item->{
			JsonObject match =item.getAsJsonObject();
			int gameTypeCode = match.get("queue").getAsInt();
			
			if(gameTypeCode==GameType.RANKED_FLEX_SR.getCode() || gameTypeCode==GameType.RANKED_SOLO_5x5.getCode()) {
				return true;
			}
			return false;
		})
		.forEach(item->{
			map.put(item.getAsJsonObject().get("gameId").getAsString(), item.getAsJsonObject().get("queue").getAsInt());
		});
		
		System.out.println(map);
		
		List<String> matchinfoList = matchinfoMapper.getNotExistMatchinfo(new ArrayList<String>(map.keySet()));
		
		matchinfoList.forEach(item->{
			String gameId = item;
			int gameTypeCode = map.get(item);
			Thread t = new Thread(group, gameId) {
				@Override
				public void run() {
					int cnt = 0 ; 
					mlist.add(readMatchDetail(gameId,gameTypeCode));
				}
			};
			t.start();
		});
		
		while(group.activeCount()>0) {
		}
		
		if(mlist.size() < 1) {
			return;
		}
		
		addMatchInfo(mlist);
		addTeamInfo(mlist);
		addTeamMemberInfo(mlist);
		
		List<String>gameList = mlist.stream().map(item->item.getMatchinfoVo().getMatchid()).collect(Collectors.toList());
		
		champMapper.updateWin(gameList);
		champMapper.updateLose(gameList);
		
	}

	public MatchInfosWrapper readMatchDetail(String gameId,int code) {
		JsonObject matchInfo = dataRequester.getMatchInfo(gameId);
		
		MatchinfoVo mvo = new MatchinfoVo(
				matchInfo.get("gameId").getAsString(), 
				GameType.getStringType(code), 
				matchInfo.get("gameDuration").getAsLong(), 
				new Date(matchInfo.get("gameCreation").getAsLong())
				);
		
		return new MatchInfosWrapper(mvo,matchInfo);
	}
	
	@Override
	public void addMatchInfo(List<MatchInfosWrapper> mlist) {

		matchinfoMapper.addMatchinfo(mlist);
	}
	
	@Override
	public void addTeamInfo(List<MatchInfosWrapper> mlist) {
		
		List<TeamInfoVo> teamList = new ArrayList<TeamInfoVo>();
		List<String> banList = new ArrayList<String>();
		
		for(MatchInfosWrapper mwv : mlist) {
			JsonArray teamInfoArr = mwv.getJson().get("teams").getAsJsonArray();
			
			teamInfoArr.iterator().forEachRemaining(item->{
				JsonObject teamInfo = item.getAsJsonObject();
				TeamInfoVo vo =new TeamInfoVo(
						teamInfo.get("teamId").getAsString(),
						mwv.getMatchinfoVo().getMatchid(),
						teamInfo.get("win").getAsString(), 
						teamInfo.get("firstBlood").getAsString(), 
						teamInfo.get("firstTower").getAsString(), 
						teamInfo.get("baronKills").getAsInt(),
						teamInfo.get("dragonKills").getAsInt(),
						teamInfo.get("towerKills").getAsInt());
//				teaminfoMapper.addTeaminfo(vo);
				
				teamList.add(vo);
				
				JsonArray banarr = teamInfo.get("bans").getAsJsonArray();
				
				for(int i = 0 ; i < banarr.size();i++) {
					String cid = banarr.get(i).getAsJsonObject().get("championId").getAsString();
					if(cid.equals("-1")) {
//						System.out.println("벤기권");
						continue;
					}
					banList.add(cid);
//					System.out.println(cid);
				}
			});
		}
		
		teaminfoMapper.addTeaminfo(teamList);
		addBanList(banList);
	}
	
	@Override
	public void addBanList(List<String> list) {
		banlistMapper.addBan(list);
		champMapper.updateBan(list);
	}
	
	@Override
	public void addTeamMemberInfo(List<MatchInfosWrapper> mlist) {
		
		List<SummonerVo> sList = new ArrayList<SummonerVo>();
		List<TeamMemberinfoVo> tmList = new ArrayList<TeamMemberinfoVo>();
		
		for(MatchInfosWrapper miw : mlist) {
			JsonArray tmInfoArr = miw.getJson().get("participants").getAsJsonArray();
			JsonArray userInfoArr = miw.getJson().get("participantIdentities").getAsJsonArray();
			
			for(int i = 0; i < tmInfoArr.size(); i++) {
				JsonObject tmInfo = tmInfoArr.get(i).getAsJsonObject();
				JsonObject userInfo = userInfoArr.get(i).getAsJsonObject();
				JsonObject stats = tmInfo.get("stats").getAsJsonObject();
				
				SummonerVo svo = new SummonerVo(
						userInfo.get("player").getAsJsonObject().get("summonerName").getAsString().replaceAll(" ", ""),
						0,
						userInfo.get("player").getAsJsonObject().get("profileIcon").getAsString()
						);
				
				sList.add(svo);
				
				TeamMemberinfoVo tvo = new TeamMemberinfoVo(
						0, 
						userInfo.get("player").getAsJsonObject().get("summonerName").getAsString().replaceAll(" ", ""), 
						tmInfo.get("teamId").getAsString(),
						miw.getMatchinfoVo().getMatchid(),
						tmInfo.get("championId").getAsString(),
						stats.get("kills").getAsInt(),
						stats.get("deaths").getAsInt(),
						stats.get("assists").getAsInt(),
						stats.get("champLevel").getAsInt(),
						tmInfo.get("spell1Id").getAsInt(), 
						tmInfo.get("spell2Id").getAsInt(), 
						stats.get("perkPrimaryStyle").getAsInt(),
						stats.get("perkSubStyle").getAsInt(),
						stats.get("totalDamageDealtToChampions").getAsInt(),
						stats.get("totalDamageTaken").getAsInt(),
						stats.get("totalMinionsKilled").getAsInt() + stats.get("neutralMinionsKilled").getAsInt(), 
						stats.get("wardsPlaced").getAsInt(), 
						stats.get("wardsKilled").getAsInt(), 
						stats.get("goldEarned").getAsInt(), 
						stats.get("item0").getAsInt(), 
						stats.get("item1").getAsInt(), 
						stats.get("item2").getAsInt(), 
						stats.get("item3").getAsInt(), 
						stats.get("item4").getAsInt(), 
						stats.get("item5").getAsInt(), 
						stats.get("item6").getAsInt(), 
						stats.get("largestMultiKill").getAsInt()
						);
				
				tmList.add(tvo);
//					System.out.println(vo);
//					tminfoMapper.addTeamMemberInfo(vo);
			}
		}
		
		sList.forEach(item->addSummoner(item, false));
//		summonerMapper.addSummonerList(sList);
		
		tminfoMapper.addTeamMemberInfo(tmList);
	}
	
	@Override
	public List<MostChampVo> getMost(String name) {
		List<MostChampVo> mlist = summonerMapper.getChampLog(name);
		List<WinCountVo> wList = summonerMapper.getChampWinCnt(name, mlist);
		
		
		for(MostChampVo mvo : mlist) {
			for(WinCountVo wvo: wList) {
				if(mvo.getName().equals(wvo.getName())) {
					mvo.setWincnt(wvo.getWincnt());
					wList.remove(wvo);
					break;
				}
			}
		}
		
		return mlist;
	}
	
}
