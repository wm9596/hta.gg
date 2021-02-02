package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SummonerVo {
	private int sNum;
	private String sNickname;
	private int sLevel;
	private String icon;
	private String tier;
	private String win;
	private String lose;
	
	public SummonerVo(int sNum, String sNickname, int sLevel, String icon, String tier, String win, String lose) {
		super();
		this.sNum = sNum;
		this.sNickname = sNickname;
		this.sLevel = sLevel;
		this.icon = icon;
		this.tier = tier;
		this.win = win;
		this.lose = lose;
	}

	public SummonerVo() {
		super();
	}
	
}
