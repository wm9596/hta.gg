package gg.hta.lol.riotapi;

import java.util.HashMap;

import org.springframework.stereotype.Component;

@Component
public class RuneSpellConverter {
	
	HashMap<String, String> spell;
	HashMap<String, String> rune;
	
	public RuneSpellConverter() {
		spell = new HashMap<String, String>();
		rune = new HashMap<String, String>();
		
		spell.put("21", "SummonerBarrier.png");
		spell.put("1", "SummonerBoost.png");
		spell.put("14", "SummonerDot.png");
		spell.put("3", "SummonerExhaust.png");
		spell.put("4", "SummonerFlash.png");
		spell.put("6", "SummonerHaste.png");
		spell.put("7", "SummonerHeal.png");
		spell.put("13", "SummonerMana.png");
		spell.put("30", "SummonerPoroRecall.png");
		spell.put("31", "SummonerPoroThrow.png");
		spell.put("11", "SummonerSmite.png");
		spell.put("39", "SummonerSnowURFSnowball_Mark.png");
		spell.put("32", "SummonerSnowball.png");
		spell.put("12", "SummonerTeleport.png");
		spell.put("1", "SummonerBoost.png");
		
		rune.put("8100", "7200_Domination.png");
		rune.put("8300", "7203_Whimsy.png");
		rune.put("8000", "7201_Precision.png");
		rune.put("8400", "7204_Resolve.png");
		rune.put("8200", "7202_Sorcery.png");
	}
	
	public String convertRune(String id) {
		if(id==null)
			return null;
		return rune.get(id);
	}
	
	public String convertSpell(String id) {
		if(id==null)
			return null;
		return spell.get(id);
	}
	
}
