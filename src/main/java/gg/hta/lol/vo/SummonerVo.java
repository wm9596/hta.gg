package gg.hta.lol.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class SummonerVo {
	private int sNum;
	private String snickname;
	private int slevel;
	private String icon;
	private String tier;
	private int win;
	private int lose;

}
