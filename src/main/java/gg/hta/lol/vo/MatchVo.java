package gg.hta.lol.vo;


import java.sql.Date;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
@ToString
@Getter
@Setter
public class MatchVo {
	private int mNum;
	private Date mDate;
	private int mRate;
	private int mWinlose;
	private int tNum1;
	private int tNum2;
	public MatchVo() {
		super();
	}
	public MatchVo(int mNum, Date mDate, int mRate, int mWinlose, int tNum1, int tNum2) {
		super();
		this.mNum = mNum;
		this.mDate = mDate;
		this.mRate = mRate;
		this.mWinlose = mWinlose;
		this.tNum1 = tNum1;
		this.tNum2 = tNum2;
	}
	
	
}
