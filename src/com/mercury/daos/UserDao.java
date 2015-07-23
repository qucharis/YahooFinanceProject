package com.mercury.daos;

import com.mercury.beans.User;

public interface UserDao {
	public void addUser(User user);
	public User getUserById(int userId);
	public User getUserByUsername(String userName);
}
