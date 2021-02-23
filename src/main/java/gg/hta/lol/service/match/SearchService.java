package gg.hta.lol.service.match;

import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.match.MatchListVo;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;

public interface SearchService {
	
	public void searchSummonerInfo(String name);
	
	public SearchVo getSummoner(String name);
	
	public SummonerVo addSummoner(SummonerVo vo,boolean isUpdate);
	
//	public void addSummoner(String name,String sid);
	
	public void addQueueInfo(String sid);
	
	public void readMatchList(String aid,int start,int end,String snickname);
	
	public void addMatchInfo(String gameId,int code);
	
	public void addTeamInfo(String gameId,JsonObject teamInfo);
	
	public void addBanList(JsonArray banarr);
	
	public void addTeamMemberInfo(String gameId,JsonArray tmInfoArr, JsonArray userInfoArr);
	
	public List<MostChampVo> getMost(String name);
	
//	public List<MatchListVo> getMatchList(String name,String type);
}
