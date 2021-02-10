package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BattingTeamInfoVo {
	private int tNum;
	private String tName;
	public BattingTeamInfoVo() {
		super();
	}
	public BattingTeamInfoVo(int tNum,String tName) {
		super();
		this.tNum = tNum;
		this.tName = tName;
	}
	
}
