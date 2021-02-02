package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddfileVo {
	private int fileNum;
	private int pNum;
	private String orgPath;
	private String realPath;
	public AddfileVo() {
		super();
	}
	public AddfileVo(int fileNum, int pNum, String orgPath, String realPath) {
		super();
		this.fileNum = fileNum;
		this.pNum = pNum;
		this.orgPath = orgPath;
		this.realPath = realPath;
	}
	
}
