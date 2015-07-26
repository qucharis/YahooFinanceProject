package com.mercury.services;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

import com.mercury.beans.Stock;
import com.mercury.beans.User;

public class CustomerService {

	public void requestExchange(Stock stock, User user, int amount) {
		String[] request = new String[5];
		String fileName = "D:/serverfiles/" + user.getUserId() + ".csv";
		List<String[]> list = new ArrayList<String[]>();
		
		StockService ss = new StockService();
		
		request[0] = String.valueOf(user.getUserId());
		request[1] = String.valueOf(stock.getSid());
		request[2] = String.valueOf(amount);
		request[3] = String.valueOf(ss.get);
		request[4] = String.valueOf(user.getUserId());
		request[5] = String.valueOf(user.getUserId());

		
		try {
			CSVReader cr = new CSVReader(new FileReader(fileName));
			list = cr.readAll();
			cr.close();

			CSVWriter cw = new CSVWriter(new FileWriter(fileName));
			cw.writeAll(list);
			cw.flush();
			cw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
