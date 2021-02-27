package gg.hta.lol.vo.match;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MostChampVo {
	private String championid;
	private String name;
	private String picture;
	private float kill;
	private float death;
	private float assist;
	private float cs;
	private int cnt;
	private int wincnt;
	
	public int getRate() {
		return wincnt*100/cnt;
	}
}
