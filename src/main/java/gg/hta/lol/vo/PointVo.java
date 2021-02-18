package gg.hta.lol.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointVo {
	private int ptNum;
	private String username;
	private String method;
	private int score;
	private Date regdate;
	public PointVo() {
		super();
	}
	public PointVo(int ptNum, String username, String method, int score, Date regdate) {
		super();
		this.ptNum = ptNum;
		this.username = username;
		this.method = method;
		this.score = score;
		this.regdate = regdate;
	}
	
}
