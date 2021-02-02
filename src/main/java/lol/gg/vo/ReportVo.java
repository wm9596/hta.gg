package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ReportVo {
	private int rNum;
	private int pNum;
	private	String detail;
	public ReportVo() {
		super();
	}
	public ReportVo(int rNum, int pNum, String detail) {
		super();
		this.rNum = rNum;
		this.pNum = pNum;
		this.detail = detail;
	}
	
}
