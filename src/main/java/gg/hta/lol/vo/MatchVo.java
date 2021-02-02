package gg.hta.lol.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MatchVo {
	private int mNum;
	private Date mDate;
	private int mRate;
	private String mWinlose;
	public MatchVo() {
		super();
	}
	public MatchVo(int mNum, Date mDate, int mRate, String mWinlose) {
		super();
		this.mNum = mNum;
		this.mDate = mDate;
		this.mRate = mRate;
		this.mWinlose = mWinlose;
	}
	
}
