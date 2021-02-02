package lol.gg.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReplyVo {
	private int rNum;
	private int pNum;
	private int rereNum;
	private String rWriter;
	private String rContent;
	private Date regdate;

	public ReplyVo() {
		super();
	}

	public ReplyVo(int rNum, int pNum, int rereNum, String rWriter, String rContent, Date regdate) {
		super();
		this.rNum = rNum;
		this.pNum = pNum;
		this.rereNum = rereNum;
		this.rWriter = rWriter;
		this.rContent = rContent;
		this.regdate = regdate;
	}

}
