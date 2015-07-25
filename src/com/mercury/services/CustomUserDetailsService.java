package com.mercury.services;

import java.util.ArrayList;
import java.util.Collection;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mercury.daos.UserDao;


@Service
@Transactional(readOnly = true)
public class CustomUserDetailsService  implements UserDetailsService{
	private Logger logger = Logger.getLogger(this.getClass());
	@Autowired
	private UserDao ld;
		
	public UserDao getLd() {
		return ld;
	}
	public void setLd(UserDao ld) {
		this.ld = ld;
	}

	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		UserDetails user = null;  
		try {
			com.mercury.beans.User loginUser = ld.getUserByUsername(username);
			System.out.println("in CustomerUserDetailsService.java: username=" + username + ", get password = " + loginUser.getPassword());
			System.out.println("authority = " + loginUser.getAuthority());
			if(loginUser.getEnable() == 0) throw new Exception("disactive");
			Collection<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
			authorities.add(new SimpleGrantedAuthority(loginUser.getAuthority()));
			user = new User(
					loginUser.getUserName(),
					loginUser.getPassword(),
					true,
					true,
					true,
					true,
					authorities 
			);
		} catch (Exception e) {
			logger.error("Error in retrieving user" + e.getMessage());
			throw new UsernameNotFoundException("Error in retrieving user");
		}
		return user;
	}		  
}
