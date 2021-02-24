package gg.hta.lol.service.match;

import java.util.List;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import gg.hta.lol.vo.BanListVo;
import gg.hta.lol.vo.MatchinfoVo;
import gg.hta.lol.vo.SummonerVo;
import gg.hta.lol.vo.match.MatchInfosWrapper;
import gg.hta.lol.vo.match.MostChampVo;
import gg.hta.lol.vo.match.SearchVo;

public interface SearchService {
	
	public void searchSummonerInfo(String name);
	
	public SearchVo getSummoner(String name);
	
	public SummonerVo addSummoner(SummonerVo vo,boolean isUpdate);
	
//	public void addSummoner(String name,String sid);
	
	public void addQueueInfo(String sid);
	
	public void readMatchList(String aid,int start,int end,String snickname);
	
	public MatchInfosWrapper readMatchDetail(String gameId,int code);
	
	public void addMatchInfo(List<MatchInfosWrapper> mlist);
	
//	public void addTeamInfo(String gameId,JsonObject matchInfo);
	public void addTeamInfo(List<MatchInfosWrapper> mlist);
	
	public void addBanList(List<String> list);
	
	public void addTeamMemberInfo(List<MatchInfosWrapper> mlist);
//	public void addTeamMemberInfo(String gameId,JsonObject matchInfo);
	
	public List<MostChampVo> getMost(String name);
	
//	public List<MatchListVo> getMatchList(String name,String type);
}
