package gg.hta.lol.vo.match;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class MatchListVo {
	private String type;
	private String snickname;
	private String championid;
	private String matchid;
	private String teamid;
	private String name;
	private String picture;
	private int kill;
	private int death;
	private int assist;
	private String championlevel;
	private String spell1;
	private String spell2;
	private String rune1;
	private String rune2;
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
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	private Date startTime;
	private String winlose;
	private List<ParticipantsVo> friendly;
	private List<ParticipantsVo> enemy;
}
