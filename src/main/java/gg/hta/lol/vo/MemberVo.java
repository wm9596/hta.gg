package gg.hta.lol.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
@Getter
@Setter
public class MemberVo {
	private String username;
	private String snickname;
	private String password;
	private char enable;
	private String email;
	private Date regDate;
	private String nickname;
	private int point;
	public MemberVo() {
		super();
	}
	public MemberVo(String username, String snickname, String password, char enable, String email, Date regDate,
			String nickname, int point) {
		super();
		this.username = username;
		this.snickname = snickname;
		this.password = password;
		this.enable = enable;
		this.email = email;
		this.regDate = regDate;
		this.nickname = nickname;
		this.point = point;
	}
}
