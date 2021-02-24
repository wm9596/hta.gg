package gg.hta.lol.riotapi;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import gg.hta.lol.mapper.ChampionMapper;
import gg.hta.lol.vo.ChampionVo;
import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = 
{
"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security_config.xml",
"file:src/main/webapp/WEB-INF/spring/email/email-config.xml"
})
@Setter
public class StaticDataInsert {

	@Autowired
	private ChampionMapper mapper;
	
	@Autowired
	DataRequester dr;
	
	@Test
	public void addChamp() {
		mapper.deleteAllChampion();
		String summaryUrl = "http://ddragon.leagueoflegends.com/cdn/11.4.1/data/ko_KR/champion.json";
		String detailUrl = "http://ddragon.leagueoflegends.com/cdn/11.4.1/data/ko_KR/champion/%s.json";
		
		JsonObject obj = dr.getStaticData(summaryUrl).getAsJsonObject().get("data").getAsJsonObject();
			
		for(String name :obj.getAsJsonObject().keySet()) {
			JsonObject info = dr.getStaticData(String.format(detailUrl, name)).getAsJsonObject().getAsJsonObject("data").getAsJsonObject(name);
			ChampionVo vo = new ChampionVo();
			vo.setName(info.get("name").getAsString());
			vo.setChampionid(info.get("key").getAsString());
			vo.setPicture(info.getAsJsonObject("image").get("full").getAsString());
			vo.setStory(info.get("lore").getAsString());
			
			StringBuilder sb = new StringBuilder();
			
			sb.append("운영 팁\n");
			
			for(int j =0 ; j < info.get("allytips").getAsJsonArray().size(); j++) {
				String tip = info.get("allytips").getAsJsonArray().get(j).getAsString();
				sb.append((j+1)+"."+tip+"\n");
			}
			sb.append("상대 팁\n");
			for(int j =0 ; j < info.get("enemytips").getAsJsonArray().size(); j++) {
				String tip = info.get("enemytips").getAsJsonArray().get(j).getAsString();
				sb.append((j+1)+"."+tip+"\n");
			}
			
			vo.setTip(sb.toString());
			
			
			JsonObject tempSpell = getSpellsSummary(info.get("spells").getAsJsonArray().get(0).getAsJsonObject());
			vo.setSkillQ_info(tempSpell.toString());
			vo.setSkillQ_icon(info.get("spells").getAsJsonArray().get(0).getAsJsonObject().getAsJsonObject("image").get("full").getAsString());
			
			tempSpell = getSpellsSummary(info.get("spells").getAsJsonArray().get(1).getAsJsonObject());
			vo.setSkillW_info(tempSpell.toString());
			vo.setSkillW_icon(info.get("spells").getAsJsonArray().get(1).getAsJsonObject().getAsJsonObject("image").get("full").getAsString());
			
			tempSpell = getSpellsSummary(info.get("spells").getAsJsonArray().get(2).getAsJsonObject());
			vo.setSkillE_info(tempSpell.toString());
			vo.setSkillE_icon(info.get("spells").getAsJsonArray().get(2).getAsJsonObject().getAsJsonObject("image").get("full").getAsString());
			
			tempSpell = getSpellsSummary(info.get("spells").getAsJsonArray().get(3).getAsJsonObject());
			vo.setSkillR_info(tempSpell.toString());
			vo.setSkillR_icon(info.get("spells").getAsJsonArray().get(3).getAsJsonObject().getAsJsonObject("image").get("full").getAsString());
			
			tempSpell = getPassiveSummary(info.get("passive").getAsJsonObject());
			vo.setSkillP_info(tempSpell.toString());
			vo.setSkillP_icon(info.get("passive").getAsJsonObject().getAsJsonObject("image").get("full").getAsString());
			
//			System.out.println(vo);
			mapper.addChampion(vo);
		}
	}
	
	public JsonObject getSpellsSummary(JsonObject spell) {
		JsonObject tempSpell = new JsonObject();
		tempSpell.addProperty("name", spell.get("name").getAsString());
//		tempSpell.addProperty("description", spell.get("description").getAsString());
		tempSpell.addProperty("tooltip", spell.get("tooltip").getAsString());
		
		return tempSpell;
	}
	
	public JsonObject getPassiveSummary(JsonObject spell) {
		JsonObject tempSpell = new JsonObject();
		tempSpell.addProperty("name", spell.get("name").getAsString());
		tempSpell.addProperty("description", spell.get("description").getAsString());
		
		return tempSpell;
	}
	
}
