package gg.hta.lol.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class QueueInfoVo {
	private String snickname;
	private String queueType;
	private String tier;
	private int leaguePoints;
	private int win;
	private int lose;
}
