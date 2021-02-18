package gg.hta.lol.riotapi;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
public class DataRequester {
	
	private final String KEY = "RGAPI-19840818-756b-4f29-9e24-c2e2cbcd1f4f";
	private final int MAX_TRY = 3;

	public JsonObject getSummonerInfo(String name) {
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%s?api_key="+KEY;
		
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
		String url = "https://kr.api.riotgames.com/lol/league/v4/entries/by-summoner/%s?api_key="+KEY;
		
		try {
			sid = URLEncoder.encode(sid,"utf-8");
			url = String.format(url, sid);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonArray();
	}
	
	public JsonObject getMatchList(String aid,int start,int end){
		String url = "https://kr.api.riotgames.com/lol/match/v4/matchlists/by-account/%s?endIndex=%d&beginIndex=%d&api_key="+KEY;
		
		try {
			aid = URLEncoder.encode(aid,"utf-8");
			url = String.format(url, aid,end,start);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonObject();
	}
	
	public JsonObject getMatchInfo(String mid){
		String url = "https://kr.api.riotgames.com/lol/match/v4/matches/%s?api_key="+KEY;
		
		try {
			mid = URLEncoder.encode(mid,"utf-8");
			url = String.format(url, mid);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url).getAsJsonObject();
	}

	public JsonElement getData(String url) {
		int cnt = 0;
		BufferedReader br = null;
		HttpURLConnection con =null;
		try {
			while(true) {
				URL obj = new URL(url); // 호출할 url
				con = (HttpURLConnection) obj.openConnection();

				con.setRequestMethod("GET");
				
				if(con.getResponseCode()!=200) {
					System.out.println("api 연동 실패 에러코드 : "+con.getResponseCode());
					cnt++;
					if(cnt<MAX_TRY) {
						continue;
					}else {
						throw new Exception();
					}
				}
				
				br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
				
				StringBuilder sb = new StringBuilder();
				String temp = null;
				
				while((temp=br.readLine())!=null) {
					sb.append(temp);
				}
				JsonParser parser = new JsonParser();
				
				return parser.parse(sb.toString());
			}
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (br != null)
				try {
					br.close();
				} catch (Exception e) {
					e.printStackTrace();
				} 
			
			con.disconnect();
		}
		
	}
	
	public JsonElement getStaticData(String url) {
		
		BufferedInputStream bi= null;
	
		try {
			URL obj = new URL(url); // 호출할 url
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();
	
			con.setRequestMethod("GET");
			
			if(con.getResponseCode()!=200) {
				System.out.println("api 연동 실패 에러코드 : "+con.getResponseCode());
				throw new Exception();
			}
			
			bi = new BufferedInputStream(con.getInputStream());
			
			String data = new String( bi.readAllBytes());
			
			JsonParser parser = new JsonParser();
			return parser.parse(data);
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			if (bi != null)
				try {
					bi.close();
				} catch (Exception e) {
					e.printStackTrace();
				} 
		}
	}
	
}
