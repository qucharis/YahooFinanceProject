package com.mercury.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.math.BigDecimal;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.daos.TransactionDao;

public class TransactionService {
	@Autowired
	private TransactionDao tr;
	private StockService ss;
	
	public Set<Transaction> queryByUser(User user){
		return tr.queryTrans(user);
	}
	public Set<Transaction> queryByStock(Stock stock){
		return tr.queryTrans(stock);
	}
	
	public Set<Transaction> queryByUserStock(User user,Stock stock){
		Set<Transaction> set = tr.queryTrans(user);
		Set<Transaction> result = new HashSet<Transaction>();	
		for(Transaction t:set){
			if(t.getStock().getSid()==stock.getSid()){
				result.add(t);
			}
		}
		return result;
	}

	public void addTransaction(User user, Stock stock, int amount) {
		Transaction tran = new Transaction();
		tran.setAmount(amount);
		tran.setStock(stock);
		tran.setUser(user);
		tran.setTimestamp(new Timestamp((new java.util.Date()).getTime()));
		tran.setUnitprice(new BigDecimal(ss.getInfo(stock).getCurrentPrice()));
		tr.addTrans(tran);	
	}
	
	public void addTransaction(User user, Stock stock, int amount,Timestamp ts) {
		Transaction tran = new Transaction();
		tran.setAmount(amount);
		tran.setStock(stock);
		tran.setUser(user);
		tran.setTimestamp(ts);
		tran.setUnitprice(new BigDecimal(ss.getInfo(stock).getCurrentPrice()));
		tr.addTrans(tran);	
	}
	
	
	
	
}
