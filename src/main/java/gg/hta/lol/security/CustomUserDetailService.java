package gg.hta.lol.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import gg.hta.lol.service.MemberService;

public class CustomUserDetailService implements UserDetailsService{
	@Autowired private MemberService service;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		CustomUserDetail userDetail = service.userDetail(username);
		return userDetail;
	}
}
