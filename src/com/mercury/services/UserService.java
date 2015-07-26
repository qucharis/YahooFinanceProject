package com.mercury.services;


import com.mercury.beans.OwnershipInfo;
import com.mercury.beans.User;

public interface UserService {
	public OwnershipInfo getOwnershipInfoByUser(User user);
	public OwnershipInfo getOwnershipInfoByUserId(int userId);
	public OwnershipInfo getOwnershipInfoByUserName(String userName);
	
}
