package gg.hta.lol.riotapi;

import java.io.BufferedInputStream;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
public class DataRequester {
	
	private final String key = "RGAPI-19840818-756b-4f29-9e24-c2e2cbcd1f4f";

	public JsonObject getSummonerInfo(String name) {
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%s?api_key="+key;
		
		try {
			name = URLEncoder.encode(name,"utf-8");
			url = String.format(url, name);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonObject();
	}
	
	public JsonArray getLeagueInfo(String sid){
		String url = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/%s?api_key="+key;
		
		try {
			sid = URLEncoder.encode(sid,"utf-8");
			url = String.format(url, sid);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonArray();
	}
	
	public JsonObject getMatchList(String aid){
		String url = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/%s?endIndex=1&beginIndex=0&api_key="+key;
		
		try {
			aid = URLEncoder.encode(aid,"utf-8");
			url = String.format(url, aid);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonObject();
	}
	
	public JsonObject getMatchInfo(String mid){
		String url = "https://kr.api.riotgames.com/lol/match/v4/matches/%s?api_key="+key;
		
		try {
			mid = URLEncoder.encode(mid,"utf-8");
			url = String.format(url, mid);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonObject();
	}

	private JsonElement getData(String url) {
		BufferedInputStream in = null;
		try {
			URL obj = new URL(url); // 호출할 url
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			con.setRequestMethod("GET");

			if(con.getResponseCode()!=200) {
				throw new Exception();
			}
			
			in = new BufferedInputStream(con.getInputStream());

			String str = new String(in.readAllBytes());
			JsonParser parser = new JsonParser();
			
			return parser.parse(str);

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (in != null)
				try {
					in.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
		}
	}

	
}
