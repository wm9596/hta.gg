package gg.hta.lol.riotapi;

import lombok.Getter;

@Getter
public enum GameType {
	RANKED_FLEX_SR(440),
	RANKED_SOLO_5x5(420,430);
	
	private int code1;
	private int code2;
	
	private GameType(int num){
		code1 = num;
		code2 = 0;
	}
	
	private GameType(int num1,int num2){
		code1 = num1;
		code2 = num2;
	}
	
	public static String getStringType(int code) {
		
		for(GameType gt :GameType.values()) {
			if(gt.code1==code || gt.code2 == code) {
				return gt.toString();
			}
		}
		return "null";
	}
	
}
