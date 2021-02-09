package gg.hta.lol.service.match;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import gg.hta.lol.vo.SummonerVo;

public interface SearchService {
	
	public void searchSummonerInfo(String name);
	
	public void getSummonerInfo(String name);
	
	public void addSummoner(SummonerVo vo);
	
//	public void addSummoner(String name,String sid);
	
	public void addQueueInfo(String sid);
	
	public void getMatchList(String aid);
	
	public void addMatchInfo(String gameId,int code);
	
	public void addTeamInfo(String gameId,JsonObject teamInfo);
	
	public void addBanList(JsonArray banarr);
	
	public void addTeamMemberInfo(String gameId,JsonArray tmInfoArr, JsonArray userInfoArr);
}
