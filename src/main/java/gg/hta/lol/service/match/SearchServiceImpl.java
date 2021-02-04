package gg.hta.lol.service.match;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import gg.hta.lol.mapper.MatchInfoMapper;
import gg.hta.lol.mapper.QueueInfoMapper;
import gg.hta.lol.mapper.SummonerMapper;
import gg.hta.lol.mapper.TeamInfoMapper;
import gg.hta.lol.riotapi.DataRequester;
import gg.hta.lol.riotapi.GameType;
import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.TeamInfoVo;
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
	
	@Override
	@Transactional
	public void getSummonerInfo(String name) {
		String sid;
		String aid;
		JsonObject summonerInfo = dataRequester.getSummonerInfo(name);
		
		sid = summonerInfo.get("id").getAsString();
		aid = summonerInfo.get("accountId").getAsString();
		
		addSummoner(name,sid,summonerInfo);
		//getMatchList(aid);
	}

	public void addSummoner(String name,String sid,	JsonObject summonerInfo) {
		
		JsonArray leagueInfo = dataRequester.getLeagueInfo(sid);
		
		SummonerVo svo = new SummonerVo(
					name, 
					summonerInfo.get("summonerLevel").getAsInt(), 
					summonerInfo.get("profileIconId").getAsString()
					);
		
		summonerMapper.addSummoner(svo);
		
		for(int i = 0 ; i< leagueInfo.size() ; i++) {
			JsonObject jo = leagueInfo.get(i).getAsJsonObject();
			
			QueueInfoVo qvo = new QueueInfoVo(
					name,
					jo.get("queueType").getAsString() ,
					jo.get("tier").getAsString()+"_"+jo.get("rank").getAsString(),
					jo.get("leaguePoints").getAsInt(),
					jo.get("wins").getAsInt(), 
					jo.get("losses").getAsInt());
			queuemapper.addQueueInfo(qvo);
		}
	}
	
	public void getMatchList(String aid) {
		JsonObject matchInfo = dataRequester.getMatchList(aid);
		
		JsonArray matchArr = matchInfo.get("matches").getAsJsonArray();
		
		//TODO 디비에 있는 값은 제외하기
		
		for(int i = 0; i < matchArr.size(); i++) {
			JsonObject match =matchArr.get(i).getAsJsonObject();
			//match.get("queue").getAsInt()
			int gameTypeCode = match.get("queue").getAsInt();
			
			if(gameTypeCode==GameType.RANKED_FLEX_SR.getCode() || gameTypeCode==GameType.RANKED_SOLO_5x5.getCode()) {
//				System.out.println(match);
				addMatchInfo(match.get("gameId").getAsString(),gameTypeCode);
			}
		}
	}
	
	public void addMatchInfo(String gameId,int code) {
		JsonObject matchInfo = dataRequester.getMatchInfo(gameId);
		matchinfoMapper.addMatchinfo(
				new MatchinfoVo(
						matchInfo.get("gameId").getAsString(), 
						GameType.getStringType(code), 
						matchInfo.get("gameDuration").getAsLong(), 
						new Date(matchInfo.get("gameCreation").getAsLong())
						)
				);
		
		JsonArray teamArr = matchInfo.get("teams").getAsJsonArray();
		
		for(int i = 0 ; i < teamArr.size(); i++) {
			addTeamInfo(gameId,teamArr.get(i).getAsJsonObject());
		}
		
		addTeamMemberInfo(
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
	
	public void addTeamMemberInfo(JsonArray tmInfoArr, JsonArray userInfo) {
		
	}
	
}
