package gg.hta.lol.service.match;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

import gg.hta.lol.mapper.SummonerMapper;
import gg.hta.lol.riotapi.DataRequester;
import gg.hta.lol.vo.SummonerVo;
import lombok.AllArgsConstructor;
import lombok.Setter;

@Service
@AllArgsConstructor
public class SearchServiceImpl implements SearchService {

    @Autowired
	private DataRequester dataRequester;
	
	@Autowired
	private SummonerMapper mapper;
	
	@Override
	public void getSummonerInfo(String name) {
		String sid;
		String aid;
		JsonObject summonerInfo = dataRequester.getSummonerInfo(name);
		
		sid = summonerInfo.get("id").getAsString();
		aid = summonerInfo.get("accountId").getAsString();
		
		System.out.println(sid);
		System.out.println(aid);
		
		JsonObject leagueInfo = dataRequester.getLeagueInfo(sid);
		
		System.out.println(leagueInfo);
		
		SummonerVo vo = new SummonerVo(
				0, 
				name, 
				summonerInfo.get("summonerLevel").getAsInt(), 
				summonerInfo.get("profileIconId").getAsString(), 
				leagueInfo.get("tier").getAsString()+"_"+leagueInfo.get("rank").getAsString(), 
				leagueInfo.get("win").getAsString(), 
				leagueInfo.get("lose").getAsString());
		
		mapper.addSummoner(vo);
	}

	@Override
	public void addSummoner(JsonObject jsonObject) {
		
	}
}
