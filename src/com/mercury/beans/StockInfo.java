package com.mercury.beans;

import java.util.List;

import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class StockInfo {
	private List<Stock> stocks;
	
	@XmlElement(name="stock")
	public List<Stock> getStocks() {
		return stocks;
	}
	public void setStocks(List<Stock> stocks) {
		this.stocks = stocks;
	}
	
	public void addStock(Stock stock) {
		stocks.add(stock);
	}
	public void removeStock(Stock stock) {
		stocks.remove(stock);
	}
}
