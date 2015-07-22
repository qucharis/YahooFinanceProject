package com.mercury.daos;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.HashSet;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.TransactionInfo;
import com.mercury.beans.User;

public interface TransactionDao {
	public void addUser(User user);
	public void addTrans(Stock stock,User user,int amount);
	public HashSet<Transaction> queryTransAll();
	public HashSet<Transaction> queryTrans(User user);
	public HashSet<Transaction> queryTrans(Stock stock);
	public HashSet<Transaction> queryTrans(User user, Date date);
	public HashSet<Transaction> queryTrans(User user, Stock stock);
	public HashSet<Transaction> queryTrans(Date date, Stock stock);
	public HashSet<Transaction> queryTrans(User user,Date date,Stock stock);
	public void deleteTrans(Transaction trans);
	public void deleteTrans(User user);
	public void deleteTrans(Stock stock);
	public void deleteTrans(User user,Stock stock);
}
