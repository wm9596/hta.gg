package gg.hta.lol.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthoritiesVo {
	private String username;
	private String authority;
	private String constraint;
	public AuthoritiesVo() {
		super();
	}
	public AuthoritiesVo(String username, String authority, String constraint) {
		super();
		this.username = username;
		this.authority = authority;
		this.constraint = constraint;
	}
	
}
