package com.mercury.serviceimpl;


import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.User;
import com.mercury.daos.UserDao;
import com.mercury.services.UserService;

public class UserServiceImpl implements UserService {
	private UserDao ud;
	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	@Override
	public OwnershipInfo getOwnershipInfoByUser(User user) {
		// TODO Auto-generated method stub
		ud.addUser(user);
		OwnershipInfo ownershipInfo = new OwnershipInfo();
		ownershipInfo.setMessage("Hello " + user.getUserName() + ", here are you owned stocks!");
		ownershipInfo.setOwnerships(user.getOwnerships());
		return ownershipInfo;
	}

	@Override
	public OwnershipInfo getOwnershipInfoByUserId(int userId) {
		// TODO Auto-generated method stub
		User user = ud.getUserById(userId);
		OwnershipInfo ownershipInfo = new OwnershipInfo();
		ownershipInfo.setMessage("Hello " + user.getUserName() + ", here are you owned stocks!");
		ownershipInfo.setOwnerships(user.getOwnerships());
		return ownershipInfo;
	}

	@Override
	public OwnershipInfo getOwnershipInfoByUserName(String userName) {
		// TODO Auto-generated method stub
		User user = ud.getUserByUsername(userName);
		OwnershipInfo ownershipInfo = new OwnershipInfo();
		ownershipInfo.setMessage("Hello " + user.getUserName() + ", here are you owned stocks!");
		ownershipInfo.setOwnerships(user.getOwnerships());
		return ownershipInfo;
	}



}
