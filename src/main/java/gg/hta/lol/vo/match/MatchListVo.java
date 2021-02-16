package gg.hta.lol.vo.match;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchListVo {
	private String type;
	private String snickname;
	private String matchid;
	private String teamid;
	private String name;
	private String picture;
	private int kill;
	private int death;
	private int assist;
	private String championlevel;
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
	private String runtime;	
	private Date startTime;
	private List<ParticipantsVo> friendly;
	private List<ParticipantsVo> enemy;
}
