package com.mercury.beans;

import java.util.*;

public class Stock {
	private int sid;
	private String scode;
	private String stockName;
	private Set<Ownership> ownerships;
	
	public Stock() {
		ownerships = new HashSet<Ownership>();
	}
	public Stock(String stockName, String scode) {
		this();
		this.stockName = stockName;
		this.scode = scode;
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
	public Set<Ownership> getOwnerships() {
		return ownerships;
	}
	public void setOwnerships(Set<Ownership> ownerships) {
		this.ownerships = ownerships;
	}
	public String toString() {
		return scode + ": " + stockName;
	}
	public void addOwnership(Ownership ownership) {
		ownerships.add(ownership);
	}
	public void removeOwnership(Ownership ownership) {
		ownerships.remove(ownership);
	}
}

