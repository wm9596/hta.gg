package gg.hta.lol.vo.match;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ParticipantsVo {
	private String teamid;
	private String snickname;
	private String matchid;
	private String name;
	private String picture;
	private int kill;
	private int death;
	private int assist;
}
