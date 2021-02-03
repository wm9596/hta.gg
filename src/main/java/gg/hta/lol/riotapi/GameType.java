package gg.hta.lol.riotapi;

import lombok.Getter;

@Getter
public enum GameType {
	RANKED_FLEX_SR(440),
	RANKED_SOLO_5x5(420);
	
	private int code;
	
	GameType(int num){
		code = num;
	}
	
}
