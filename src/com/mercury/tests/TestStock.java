package com.mercury.tests;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mercury.beans.*;
import com.mercury.daos.StockDao;

public class TestStock {
	public static void showUsers(List<User> users) {
		for (User user:users) {
			System.out.println(user);
		}
	}
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext actx = new ClassPathXmlApplicationContext("config.xml");
		StockDao sd = (StockDao)actx.getBean("stock");
		// Save a stock
		Stock stock = new Stock("google", "goog");
		sd.addStock(stock);
		System.out.println("User is saved");
		/*
		// Show all users
		sd.getStockByStockID(1);
		// Update the user
		user.setAge(72);
		hd.update(user);
		System.out.println("User is updated");
		showUsers(hd.query());
		// Delete the user
		hd.delete(user);*/
	}
}
