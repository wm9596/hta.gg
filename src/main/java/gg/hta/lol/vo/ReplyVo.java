package gg.hta.lol.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class ReplyVo {
	private int rNum;
	private int pNum;
	private int rereNum;
	private String rWriter;
	private String rContent;
	private Date regdate;
	private int rHit;
	private int rNohit;
	public ReplyVo() {}

	public ReplyVo(int rNum, int pNum, int rereNum, String rWriter, String rContent, Date regdate) {
		super();
		this.rNum = rNum;
		this.pNum = pNum;
		this.rereNum = rereNum;
		this.rWriter = rWriter;
		this.rContent = rContent;
		this.regdate = regdate;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getRereNum() {
		return rereNum;
	}

	public void setRereNum(int rereNum) {
		this.rereNum = rereNum;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getRegdate() {
		SimpleDateFormat sdfm = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return sdfm.format(regdate);
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getrHit() {
		return rHit;
	}

	public void setrHit(int rHit) {
		this.rHit = rHit;
	}

	public int getrNohit() {
		return rNohit;
	}

	public void setrNohit(int rNohit) {
		this.rNohit = rNohit;
	}

	@Override
	public String toString() {
		return "ReplyVo [rNum=" + rNum + ", pNum=" + pNum + ", rereNum=" + rereNum + ", rWriter=" + rWriter
				+ ", rContent=" + rContent + ", regdate=" + regdate + ", rHit=" + rHit + ", rNohit=" + rNohit + "]";
	}

}
