package gg.hta.lol.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class TeamMemberinfoVo {
	private int tmnum;
	private String snickname;
	private String teamId;
	private String matchId;
	private String championId;
	private int kill;
	private int death;
	private int assist;
	private int championLevel;
	private int spell1;
	private int spell2;
	private int rune1;
	private int rune2;
	private String tier;
	private int championDamage;
	private int takenDamage;
	private int cs;
	private int wardInstall;
	private int wardRemove;
	private int gold;
	private int item1;
	private int item2;
	private int item3;
	private int item4;
	private int item5;
	private int item6;
	private int accessory;
	private int multiKill;
	
}
