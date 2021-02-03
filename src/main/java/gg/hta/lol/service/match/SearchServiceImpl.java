package gg.hta.lol.service.match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import gg.hta.lol.mapper.QueueInfoMapper;
import gg.hta.lol.mapper.SummonerMapper;
import gg.hta.lol.riotapi.DataRequester;
import gg.hta.lol.riotapi.GameType;
import gg.hta.lol.vo.QueueInfoVo;
import gg.hta.lol.vo.SummonerVo;
import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {

    @Autowired
	private DataRequester dataRequester;
	
	@Autowired
	private SummonerMapper smapper;
	@Autowired
	private QueueInfoMapper qmapper;
	
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
		
		smapper.addSummoner(svo);
		
		for(int i = 0 ; i< leagueInfo.size() ; i++) {
			JsonObject jo = leagueInfo.get(i).getAsJsonObject();
			
			QueueInfoVo qvo = new QueueInfoVo(
					name,
					jo.get("queueType").getAsString() ,
					jo.get("tier").getAsString()+"_"+jo.get("rank").getAsString(),
					jo.get("wins").getAsInt(), 
					jo.get("losses").getAsInt());
			qmapper.addQueueInfo(qvo);
		}
	}
	
	public void getMatchList(String aid) {
		JsonObject matchInfo = dataRequester.getMatchList(aid);
		
		JsonArray matchArr = matchInfo.get("matches").getAsJsonArray();
		
		for(int i = 0; i < matchArr.size(); i++) {
			JsonObject match =matchArr.get(i).getAsJsonObject();
			//match.get("queue").getAsInt()
			int gameTypeCode = match.get("queue").getAsInt();
			
			if(gameTypeCode==GameType.RANKED_FLEX_SR.getCode() || gameTypeCode==GameType.RANKED_SOLO_5x5.getCode()) {
//				System.out.println(match);
				addMatchInfo(match.get("gameId").getAsString());
			}
		}
	}
	
	public void addMatchInfo(String gameId) {
		
		JsonObject matchInfo = dataRequester.getMatchInfo(gameId);
		System.out.println(matchInfo);
	}
	
}
