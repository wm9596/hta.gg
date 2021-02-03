package gg.hta.lol.service.match;

import com.google.gson.JsonObject;

public interface SearchService {
	
	public void getSummonerInfo(String name);
	
	public void addSummoner(JsonObject jsonObject);
}
