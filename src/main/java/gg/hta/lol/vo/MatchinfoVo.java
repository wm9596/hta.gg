package gg.hta.lol.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MatchinfoVo {
	private String matchid;
	private String type;
	private String runtime;	
	private Date startTime;
	
	
	public MatchinfoVo(String matchid, String type, long runtime, Date startTime) {
		super();
		this.matchid = matchid;
		this.type = type;
		int m = (int) (runtime/60);
		int sec = (int) (runtime%60);
		this.runtime = m+"분 "+sec+" 초";
		this.startTime = startTime;
	}
	
}
