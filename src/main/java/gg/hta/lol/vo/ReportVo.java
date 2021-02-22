package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class ReportVo {
	private int rNum;
	private int pNum;
	private String username;
	private	String detail;
	public ReportVo() {
		super();
	}
	public ReportVo(int rNum, int pNum, String username, String detail) {
		super();
		this.rNum = rNum;
		this.pNum = pNum;
		this.detail = detail;
	}
	
}
