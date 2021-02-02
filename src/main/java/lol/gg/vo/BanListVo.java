package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BanListVo {
	private int bNum;
	private String championid;
	public BanListVo() {
		super();
	}
	public BanListVo(int bNum, String championid) {
		super();
		this.bNum = bNum;
		this.championid = championid;
	}
	
}
