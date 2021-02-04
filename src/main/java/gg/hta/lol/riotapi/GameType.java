package gg.hta.lol.riotapi;

import lombok.Getter;

@Getter
public enum GameType {
	RANKED_FLEX_SR(440),
	RANKED_SOLO_5x5(420);
	
	private int code;
	
	private GameType(int num){
		code = num;
	}
	
	public static String getStringType(int code) {
		
		for(GameType gt :GameType.values()) {
			if(gt.code==code) {
				return gt.toString();
			}
		}
		return "null";
	}
	
}
