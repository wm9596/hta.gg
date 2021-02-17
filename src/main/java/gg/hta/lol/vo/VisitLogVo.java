package gg.hta.lol.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class VisitLogVo {
	private Date vDate;
	public VisitLogVo(Date vDate) {
		super();
		this.vDate = vDate;
	}
	public VisitLogVo() {
		super();
	}
}
