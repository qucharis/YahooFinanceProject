package com.mercury.services;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;


import au.com.bytecode.opencsv.CSVReader;

import com.mercury.beans.Ownership;
import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.daos.UserDao;

@Service
public class AdminService {
	@Autowired
	private TransactionService ts;
	@Autowired
	private UserService us;
	@Autowired
	private UserDao ud;
	@Autowired
	private StockService ss;
	
	public void addStockByCode(String name, String code){
		ss.addStock(new Stock(name,code));
	}
	public void addStock(Stock stock){
		ss.addStock(stock);
	}
	
/*	public void deleteStockByCode(String code){
		ss.deleteStock(code);
	}*/

	public void parseAllRequsets() {


	}

}
