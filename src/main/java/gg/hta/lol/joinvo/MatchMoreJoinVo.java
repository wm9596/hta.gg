package gg.hta.lol.joinvo;

import gg.hta.lol.vo.SummonerVo;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchMoreJoinVo {
	private String teamId;
	private String matchId;
	private String winlose;
	private String firstBlood;
	private String firstTower;
	private int baronKill;
	private int dragonKill;
	private int towerKill;
	
	private int tmnum;
	private String snickname;
	private String championId;
	private int kill;
	private int death;
	private int assist;
	private int championLevel;
	private int spell1;
	private int spell2;
	private int rune1;
	private int rune2;
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
	
	private int slevel;
	private String icon;
	
	private String queueType;
	private String tier;
	private int leaguePoints;
	private int win;
	private int lose;
}
