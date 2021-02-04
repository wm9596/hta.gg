package gg.hta.lol.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeamInfoVo {
	private String teamId;
	private String matchId;
	private String winlose;
	private String firstBlood;
	private String firstTower;
	private int baronKill;
	private int dragonKill;
	private int towerKill;
	
}
