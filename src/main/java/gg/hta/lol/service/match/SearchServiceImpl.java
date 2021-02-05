package gg.hta.lol.service.match;

import java.sql.Date;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import gg.hta.lol.mapper.MatchInfoMapper;
import gg.hta.lol.mapper.QueueInfoMapper;
import gg.hta.lol.mapper.SummonerMapper;
import gg.hta.lol.mapper.TeamInfoMapper;
import gg.hta.lol.mapper.TeamMemberInfoMapper;
import gg.hta.lol.riotapi.DataRequester;
import gg.hta.lol.riotapi.GameType;
import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.TeamInfoVo;
import gg.hta.lol.vo.TeamMemberinfoVo;
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
	
	@Override
	public void searchSummonerInfo(String name) {
		getSummonerInfo(name);
	}
	
	public void getSummonerInfo(String name) {
		String sid;
		String aid;
		JsonObject summonerInfo = dataRequester.getSummonerInfo(name);
		
		sid = summonerInfo.get("id").getAsString();
		aid = summonerInfo.get("accountId").getAsString();
		
		addSummoner(name,sid,summonerInfo);
		getMatchList(aid);
	}
	
	@Transactional(noRollbackFor = DuplicateKeyException.class)
	public void addSummoner(String name,String sid,	JsonObject summonerInfo) {
		
		JsonArray leagueInfo = dataRequester.getLeagueInfo(sid);
		
		SummonerVo svo = new SummonerVo(
					name, 
					summonerInfo.get("summonerLevel").getAsInt(), 
					summonerInfo.get("profileIconId").getAsString()
					);
		
		try {
			summonerMapper.addSummoner(svo);
		}catch (DuplicateKeyException e) {
			System.out.println("소환사정보 중복 정보 수정");
			summonerMapper.updateSummoner(svo);
		}
		
		for(int i = 0 ; i< leagueInfo.size() ; i++) {
			JsonObject jo = leagueInfo.get(i).getAsJsonObject();
			
			QueueInfoVo qvo = new QueueInfoVo(
					name,
					jo.get("queueType").getAsString() ,
					jo.get("tier").getAsString()+"_"+jo.get("rank").getAsString(),
					jo.get("leaguePoints").getAsInt(),
					jo.get("wins").getAsInt(), 
					jo.get("losses").getAsInt());
			
			try {
				queuemapper.addQueueInfo(qvo);
			}catch (DuplicateKeyException e) {
				System.out.println("큐별 티어 정보 중복 정보 수정");
				queuemapper.updateQueueInfo(qvo);
			}
			
		}
		
		System.out.println(svo);
	}
	
	public void addSummoner(String name,String sid) {
		
		JsonObject summonerInfo = dataRequester.getSummonerInfo(name);
		addSummoner(name,sid,summonerInfo);
	}
	
	public void getMatchList(String aid) {
		JsonObject matchInfo = dataRequester.getMatchList(aid);
		
		JsonArray matchArr = matchInfo.get("matches").getAsJsonArray();
		
		//TODO 디비에 있는 값은 제외하기
		
		for(int i = 0; i < matchArr.size(); i++) {
			JsonObject match =matchArr.get(i).getAsJsonObject();
			int gameTypeCode = match.get("queue").getAsInt();
			
			if(gameTypeCode==GameType.RANKED_FLEX_SR.getCode() || gameTypeCode==GameType.RANKED_SOLO_5x5.getCode()) {
				addMatchInfo(match.get("gameId").getAsString(),gameTypeCode);
			}
		}
	}
	
	@Transactional(noRollbackFor = DuplicateKeyException.class)
	public void addMatchInfo(String gameId,int code) {
		JsonObject matchInfo = dataRequester.getMatchInfo(gameId);
		
		try {
			matchinfoMapper.addMatchinfo(
					new MatchinfoVo(
							matchInfo.get("gameId").getAsString(), 
							GameType.getStringType(code), 
							matchInfo.get("gameDuration").getAsLong(), 
							new Date(matchInfo.get("gameCreation").getAsLong())
							)
					);
		}catch (DuplicateKeyException e) {
			System.out.println("게임정보 중복");
			return;
		}
		
		JsonArray teamArr = matchInfo.get("teams").getAsJsonArray();
		
		for(int i = 0 ; i < teamArr.size(); i++) {
			addTeamInfo(gameId,teamArr.get(i).getAsJsonObject());
		}
		
		addTeamMemberInfo(
				gameId,
				matchInfo.get("participants").getAsJsonArray(),
				matchInfo.get("participantIdentities").getAsJsonArray()
				);
		
	}
	
	public void addTeamInfo(String gameId,JsonObject teamInfo) {
			teaminfoMapper.addTeaminfo(new TeamInfoVo(
					teamInfo.get("teamId").getAsString(),
					gameId,
					teamInfo.get("win").getAsString(), 
					teamInfo.get("firstBlood").getAsString(), 
					teamInfo.get("firstTower").getAsString(), 
					teamInfo.get("baronKills").getAsInt(),
					teamInfo.get("dragonKills").getAsInt(),
					teamInfo.get("towerKills").getAsInt()));
	}
	
	public void addTeamMemberInfo(String gameId,JsonArray tmInfoArr, JsonArray userInfoArr) {
		
		for(int i = 0; i < tmInfoArr.size(); i++) {
			JsonObject tmInfo = tmInfoArr.get(i).getAsJsonObject();
			JsonObject userInfo = userInfoArr.get(i).getAsJsonObject();
			JsonObject stats = tmInfo.get("stats").getAsJsonObject();
			
			addSummoner(
					userInfo.get("player").getAsJsonObject().get("summonerName").getAsString(), 
					userInfo.get("player").getAsJsonObject().get("summonerId").getAsString());
			
				tminfoMapper.addTeamMemberInfo(
						new TeamMemberinfoVo(
							0, 
							userInfo.get("player").getAsJsonObject().get("summonerName").getAsString(), 
							tmInfo.get("teamId").getAsString(),
							gameId,
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
							) 
					);
			
		}
		
	}
	
}
