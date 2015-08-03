package com.mercury.services;

import java.math.BigDecimal;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.User;
import com.mercury.daos.UserDao;

public class UserService {
	@Autowired
	private UserDao ud;


	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}
	
	public void addBalance(String userName, BigDecimal addMoney) {
		User user =ud.getUserByUsername(userName);
		double newBalance =user.getBalance().doubleValue() + addMoney.doubleValue();
		if(newBalance<99999999) {
			user.setBalance(new BigDecimal(newBalance));
			ud.updateUser(user);
		}
	}
	
	public BigDecimal getBalance(String userName) {
		return ud.getUserByUsername(userName).getBalance();
	}
	
	public OwnershipInfo getOwnershipInfoByUser(User user) {
		// TODO Auto-generated method stub
		//ud.addUser(user);
		OwnershipInfo ownershipInfo = new OwnershipInfo();
		ownershipInfo.setMessage("Welcome back " + user.getUserName() + ", here are you owned stocks:");
		ownershipInfo.setOwnerships(user.getOwnerships());
		return ownershipInfo;
	}

	public OwnershipInfo getOwnershipInfoByUserId(int userId) {
		// TODO Auto-generated method stub
		User user = ud.getUserById(userId);
		OwnershipInfo ownershipInfo = new OwnershipInfo();
		ownershipInfo.setMessage("Welcome back " + user.getUserName() + ", here are you owned stocks:");
		ownershipInfo.setOwnerships(user.getOwnerships());
		return ownershipInfo;
	}

	public OwnershipInfo getOwnershipInfoByUserName(String userName) {
		// TODO Auto-generated method stub
		User user = ud.getUserByUsername(userName);
		OwnershipInfo ownershipInfo = new OwnershipInfo();
		ownershipInfo.setMessage("Welcome back " + user.getUserName() + ", here are you owned stocks:");
		ownershipInfo.setOwnerships(user.getOwnerships());
		return ownershipInfo;
	}
	
	public User getUser(int id){
		return ud.getUserById(id);
	}
	
	public User getUser(String name){
		return ud.getUserByUsername(name);
	}
	
	public void updateUser(User user){
		ud.updateUser(user);
	}

	public User getUserByEmail(String email){
		Set<User> set = ud.queryAll();
		for(User u:set){
			if (u.getEmail().equals(email))
			return u;
		}
		return null;
		
	}


}
