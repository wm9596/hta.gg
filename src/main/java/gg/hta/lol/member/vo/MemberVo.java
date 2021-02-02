package gg.hta.lol.member.vo;

import java.sql.Date;

public class MemberVo {
	private String username;
	private int sNum;
	private String password;
	private char enable;
	private String email;
	private Date regdate;
	private String nickname;
	private int point;
	
	public MemberVo() {  }
	public MemberVo(String username, int sNum, String password, char enable, String email, Date regdate,
			String nickname, int point) {
		super();
		this.username = username;
		this.sNum = sNum;
		this.password = password;
		this.enable = enable;
		this.email = email;
		this.regdate = regdate;
		this.nickname = nickname;
		this.point = point;
	}

	public String getUsername() {
		return username;
	}
	
	public void setUsername(String username) {
		this.username = username;
	}

	public int getsNum() {
		return sNum;
	}

	public void setsNum(int sNum) {
		this.sNum = sNum;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public char getEnable() {
		return enable;
	}

	public void setEnable(char enable) {
		this.enable = enable;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}
}
