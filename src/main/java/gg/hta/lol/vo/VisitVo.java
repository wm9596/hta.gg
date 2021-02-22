package gg.hta.lol.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VisitVo {
	private Date regdate;
	private int cnt;
	public VisitVo(Date regdate, int cnt) {
		super();
		this.regdate = regdate;
		this.cnt = cnt;
	}
	public VisitVo() {
		super();
	}
}
