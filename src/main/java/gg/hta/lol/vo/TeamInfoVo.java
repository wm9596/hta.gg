package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TeamInfoVo {
	private String TEAMID;
	private String MATCHID;
	private String WINLOSE;
	private String FIRSTBLOOD;
	private String FIRSTTOWER;
	private String BARONKILL;
	private String DRAGONKILL;
	private String TOWERKILL;
	public TeamInfoVo() {
		super();
	}
	public TeamInfoVo(String tEAMID, String mATCHID, String wINLOSE, String fIRSTBLOOD, String fIRSTTOWER,
			String bARONKILL, String dRAGONKILL, String tOWERKILL) {
		super();
		TEAMID = tEAMID;
		MATCHID = mATCHID;
		WINLOSE = wINLOSE;
		FIRSTBLOOD = fIRSTBLOOD;
		FIRSTTOWER = fIRSTTOWER;
		BARONKILL = bARONKILL;
		DRAGONKILL = dRAGONKILL;
		TOWERKILL = tOWERKILL;
	}
	
}
