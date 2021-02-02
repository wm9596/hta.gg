package lol.gg.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Setter
@Getter

public class MatchinfoVo {
	private String matchid;
	private String type;
	private String runtime;	
	private Date startTime;
	public MatchinfoVo() {
		super();
	}
	public MatchinfoVo(String matchid, String type, String runtime, Date startTime) {
		super();
		this.matchid = matchid;
		this.type = type;
		this.runtime = runtime;
		this.startTime = startTime;
	}
	
	
}
