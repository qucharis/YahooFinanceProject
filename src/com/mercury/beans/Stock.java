package com.mercury.beans;

import java.util.*;

public class Stock {
	private int sid;
	private String scode;
	private String stockName;
	private Set<User> buyers;
	
	public Stock() {
		this.buyer = new HashSet<User>();
	}
	public Stock(int sid, String stockName) {
		this();
		this.sid = sid;
		this.stockName = stockName;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getStockName() {
		return stockName;
	}
	public void setStockName(String stockName) {
		this.stockName = stockName;
	}
	public Set<User> getBuyers() {
		return buyers;
	}
	public void setBuyers(Set<User> buyers) {
		this.buyers = buyers;
	}
	public void addBuyer(User buyer) {
		buyers.add(buyer);
	}
	public void removeBuyer(User buyer) {
		buyers.remove(buyer);
	}
}

