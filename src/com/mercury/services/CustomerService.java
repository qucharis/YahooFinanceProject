package com.mercury.services;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;


import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

import com.mercury.beans.RequestInfo;
import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.daos.StockDao;
import com.mercury.daos.UserDao;


public class CustomerService {
	@Autowired
	private UserDao ud;
	@Autowired
	private StockDao sd;
	
	
	@SuppressWarnings("deprecation")
	public Set<RequestInfo> queryPending(User user) throws IOException{
		Set<RequestInfo> set = new HashSet<RequestInfo>();
		
		List<String[]> list = new ArrayList<String[]>();
		File f = new File("D:/serverfiles/"+user.getUserId()+"_requests.csv");
		try {
			CSVReader cr = new CSVReader(new FileReader(f));
			list = cr.readAll();
			cr.close();
		} catch (IOException e) {
			e.printStackTrace();
			throw e;
		}
		for (String[] s:list){
			for(int i = 0;i<s.length;i++){
				System.out.print(s[i]);
				System.out.print("-");
			}
			System.out.println();
		}
		DateFormat df = new SimpleDateFormat("EEE MMM dd kk:mm:ss z yyyy", Locale.ENGLISH);
		System.out.println(list.size());
		if (list.size() != 0) {
			for (String[] s : list) {
				RequestInfo request = new RequestInfo();
				Stock stock = sd.getStockByStockID(Integer.valueOf(s[1]));
				request.setStockName(stock.getStockName());
				request.setStockCode(stock.getScode());
				request.setAmount(Integer.valueOf(s[2]));
				request.setUnitprice(Double.valueOf(s[3]));
				try {
					request.setTs(new Timestamp(df.parse(s[4]).getTime()));
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				set.add(request);
			}
			
			return set;
		}
		return null;
	}
	
	public void requestExchange(StockInfo stockInfo, User user, int amount) throws IOException {
		String[] request = new String[6];
		String fileName = "D:/serverfiles/" + user.getUserId() + "_requests.csv";
		List<String[]> list = new ArrayList<String[]>();
		Date date= new Date();
		request[0] = String.valueOf(user.getUserId());
		request[1] = String.valueOf(stockInfo.getSid());
		request[2] = String.valueOf(amount);
		request[3] = String.valueOf(stockInfo.getCurrentPrice());
		request[4] = date.toString();
		try {
			CSVReader cr = new CSVReader(new FileReader(fileName));
			list = cr.readAll();
			cr.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			CSVWriter cw = new CSVWriter(new FileWriter(fileName));
			cw.flush();
			cw.close();
			CSVReader cr = new CSVReader(new FileReader(fileName));
			list = cr.readAll();
			cr.close();
		}
		try {
			CSVWriter cw = new CSVWriter(new FileWriter(fileName));
			cw.writeAll(list);
			cw.writeNext(request);
			cw.flush();
			cw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
	}
	
	
	
	
}
