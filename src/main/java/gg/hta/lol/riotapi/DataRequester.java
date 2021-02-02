package gg.hta.lol.riotapi;

import java.io.BufferedInputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Type;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class DataRequester {
	
	private final String key = "RGAPI-2682102c-6a74-4c83-abfe-65805489ac64";

	public HashMap<String, String> getSummonerInfo(String name) {
		String url = "https://kr.api.riotgames.com/lol/summoner/v4/summoners/by-name/%s?api_key="+key;
		
		try {
			name = URLEncoder.encode(name,"utf-8");
			url = String.format(url, name);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
		return getData(url);
	}
	
	public HashMap<String, String> getLeagueInfo(){
	
		return null;
	}
	
	public HashMap<String, String> getMatchInfo(){
		
		return null;
	}

	private HashMap<String, String> getData(String url) {
		BufferedInputStream in = null;
		try {
//			String id = URLEncoder.encode(request.getParameter("id"),"UTF-8");
			URL obj = new URL(url); // 호출할 url
			HttpURLConnection con = (HttpURLConnection) obj.openConnection();

			con.setRequestMethod("GET");

			in = new BufferedInputStream(con.getInputStream());

			String str = new String(in.readAllBytes());

			Gson gson = new Gson();
			Type type = new TypeToken<HashMap<String,String>>(){}.getType();
			
			return gson.fromJson(str, type);

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
