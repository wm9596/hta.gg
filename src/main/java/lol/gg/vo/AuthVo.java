package lol.gg.vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AuthVo {
	private String username;
	private String code;
	public AuthVo() {
		super();
	}
	public AuthVo(String username, String code) {
		super();
		this.username = username;
		this.code = code;
	}
	
}
