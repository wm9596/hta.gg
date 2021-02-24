package gg.hta.lol.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class VisitVo {
	private Date regdate;
	private int cnt;
//	public VisitVo(Date regdate, int cnt) {
//		super();
//		this.regdate = regdate;
//		this.cnt = cnt;
//	}
//	public VisitVo() {
//		super();
//	}
}
