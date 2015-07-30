package com.mercury.services;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.util.HashSet;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;

import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.daos.StockDao;

public class StockService {
	@Autowired
	private StockDao sd;
	
	public void addStock(Stock stock){
		sd.addStock(stock);
	}
	public void deleteStock(Stock stock){
		sd.deleteStock(stock);
	}
	
	//for Admin to judge whether the stock is existed or not
	public boolean isExisted(Stock stock) {
		Set<Stock> stocks = sd.queryAll();
		for(Stock st:stocks) {
			if(stock.getScode().equalsIgnoreCase(st.getScode()) || stock.getStockName().equalsIgnoreCase(st.getStockName())) {
				return true;
			}
		}
		return false;
	}
	
	//for Admin to remove stock
	public Stock getStockByScode(String scode) {
		return sd.getStockByStockCode(scode);
	}
	
	//To get all stocks in the stocks table
	public Set<Stock> getAllStocks() {
		return sd.queryAll();
	}
	
	public StockInfo getStockInfoBCode(String code){
		Set<Stock> set = sd.queryAll();
		for(Stock s : set){
			if(s.getScode().equals(code)){
				return getInfo(s);
			}
		}
		return null;
	}
	
	public StockInfo getStockInfoById(int id){
		return getInfo(sd.getStockByStockID(id));
	}

	public double getPrice(Stock stock){
		return getInfo(stock).getCurrentPrice();
	}
	
	//get real time stockInfo
	public Set<StockInfo> getInfo(Set<Stock> stocks) {
		Set<StockInfo> sf = new HashSet<StockInfo>();
		for (Stock s : stocks) {
			sf.add(getInfo(s));
		}
		return sf;
	}
	
	//get real time market data
	public StockInfo getInfo(Stock stock) {

		String stockCode = stock.getScode();

		String yahoo_quote = "http://finance.yahoo.com/d/quotes.csv?s="
				+ stockCode + "&f=svc1l1&e=.c";
		StockInfo si = new StockInfo(stock);
		try {
			URL url = new URL(yahoo_quote);
			URLConnection urlconn = url.openConnection();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					urlconn.getInputStream()));
			String content = in.readLine();
			//System.out.println(content);
			content = content.replace((char) 34, (char) 32);
			String[] tokens = content.split(",");
			si.setPricechange(Double.parseDouble(tokens[tokens.length - 2].trim()));
			si.setCurrentPrice(Double.parseDouble(tokens[tokens.length - 1].trim()));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return si;
	}
}
