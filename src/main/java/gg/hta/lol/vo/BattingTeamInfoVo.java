package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BattingTeamInfoVo {
	private int tNum;
	private int mNum;
	private String tName;
	public BattingTeamInfoVo() {
		super();
	}
	public BattingTeamInfoVo(int tNum, int mNum, String tName) {
		super();
		this.tNum = tNum;
		this.mNum = mNum;
		this.tName = tName;
	}
	
}
