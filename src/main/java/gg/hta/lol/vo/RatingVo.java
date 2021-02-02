package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class RatingVo {
	private int sNum;
	private String rate;
	
	public RatingVo() {
		super();
	}

	public RatingVo(int sNum, String rate) {
		super();
		this.sNum = sNum;
		this.rate = rate;
	}
	
}
