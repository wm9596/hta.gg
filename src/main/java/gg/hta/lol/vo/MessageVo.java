package gg.hta.lol.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MessageVo {
	private int msgNum;
	private String sender;
	private String receiver;
	private String msg;
	private Date sendTime;
	private String open;
	public MessageVo() {
		super();
	}
	public MessageVo(int msgNum, String sender, String receiver, String msg, Date sendTime, String open) {
		super();
		this.msgNum = msgNum;
		this.sender = sender;
		this.receiver = receiver;
		this.msg = msg;
		this.sendTime = sendTime;
		this.open = open;
	}
	
}
