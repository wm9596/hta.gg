package gg.hta.lol.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import gg.hta.lol.vo.AuthoritiesVo;

public class CustomUserDetail implements UserDetails{ //인증객체
	private String username;
	private String password;
	private String enabled;
	private List<AuthoritiesVo> authoList;
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		ArrayList<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		for(AuthoritiesVo vo:authoList) {
			auths.add(new SimpleGrantedAuthority(vo.getAuthority()));
		}
		return auths;
	}
	//계정 비밀번호
	@Override
	public String getPassword() {
		return password;
	}
	//계정 아이디
	@Override
	public String getUsername() {
		return username;
	}
	//계정 만료
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	//계정이 잠겼는지
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	//비밀번호 만료되었는지
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	//사용가능한지
	@Override
	public boolean isEnabled() {
		return true;
	}	
}
