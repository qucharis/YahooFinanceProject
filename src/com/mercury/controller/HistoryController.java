package com.mercury.controller;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.annotation.Resource;
import javax.ws.rs.FormParam;
//import javax.ws.rs.FormParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Ownership;
import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.TransactionInfo;
import com.mercury.beans.User;
import com.mercury.daos.UserDao;
import com.mercury.services.TransactionService;

@Controller
public class HistoryController {
	@Autowired
	TransactionService transactionService;
	@Autowired
	UserDao userDao;
	
	@RequestMapping(value="/historyrecord", method=RequestMethod.POST)
	@ResponseBody
	public Set<TransactionInfo> history(@FormParam("name") String name) {
	//public List<String> history() {
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		System.out.println(userName + "...................");
		//ArrayList<Transaction> transactions = new ArrayList<Transaction>();
		User user = userDao.getUserByUsername(userName);
		System.out.println(user.getUserId()+":"+user.getUserName()+":"+user.getEmail());
		Set<Transaction> transactions = user.getTransactions();
		TreeSet<TransactionInfo> result = new TreeSet<TransactionInfo>();
		for(Transaction tran:transactions) {
			System.out.println(tran.getUser().getUserName()+":"+tran.getStock().getScode()+":"+tran.getStock().getStockName()
					+tran.getAmount()+":"+tran.getUnitprice()+":"+tran.getTimestamp());
			int userid = tran.getUser().getUserId();
			User tmpUser = new User(tran.getUser().getUserName(), tran.getUser().getPassword());
			Stock stock = new Stock(tran.getStock().getScode(), tran.getStock().getStockName());
			int amount = tran.getAmount();
			BigDecimal unitprice = tran.getUnitprice();
			Timestamp tm = tran.getTimestamp();
			result.add(new TransactionInfo(userid, tmpUser, stock, amount, unitprice, tm));
		}
		
		
		//Set<Transaction> transactions = transactionService.queryByUser(user);
		/*Set<Transaction> transactions = new HashSet<Transaction>();
		transactions.add(new Transaction(1, new User("Alex", "123"), new Stock("Amaz", "Amazon"), 10, new BigDecimal(50), new Timestamp((new java.util.Date()).getTime())));
		transactions.add(new Transaction(1, new User("Alice", "123"), new Stock("Goog", "Google"), 20, new BigDecimal(100), new Timestamp((new java.util.Date()).getTime())));*/
		//List<Transaction> result = new ArrayList<Transaction>(transactions);
		//System.out.println(reslut.);
		return result;
		/*for(Stock stock:stocks) {
			stock.setOwnerships(null);
			stock.setSid(1);
			stock.setStockName("google");
		}*/
		/*
		List<String> result = new ArrayList<String>();
		result.add("google");
		result.add("amzaon");
		result.add("baidu");
		return result;*/
	}
}
