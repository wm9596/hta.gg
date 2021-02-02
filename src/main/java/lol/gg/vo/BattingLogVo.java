package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BattingLogVo {
	private int bNum;
	private int mNum;
	private String username;
	private int choice;
	public BattingLogVo() {
		super();
	}
	public BattingLogVo(int bNum, int mNum, String username, int choice) {
		super();
		this.bNum = bNum;
		this.mNum = mNum;
		this.username = username;
		this.choice = choice;
	}
	
}
