package gg.hta.lol.riotapi;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;

import com.google.gson.JsonObject;

public class ApiTest {
	
	@Test
	public void getSummonerInfo() {
		DataRequester dr = new DataRequester();
		JsonObject info = dr.getSummonerInfo("댕청잇");
		
		assertNotNull(info);
		
		System.out.println(info);
	}
	
	//@Test
	public void getMatchList() {
		DataRequester dr = new DataRequester();
		JsonObject info = dr.getMatchList("WZYGQKT-p9O52Zx1RFbOq6NQmACGbiE5kFP0pfiEMcSa1CNvpPYJCAFA");
		assertNotNull(info);
		
		System.out.println(info);
	}
	
}
