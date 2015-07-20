package com.mercury.beans;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class Transaction {
	private int transid;
	private int userid;
	private int sid;
	private int amount;
	private BigDecimal unitprice;
	private Timestamp timestamp;
	public int getTransid() {
		return transid;
	}
	public void setTransid(int transid) {
		this.transid = transid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public BigDecimal getUnitprice() {
		return unitprice;
	}
	public void setUnitprice(BigDecimal unitprice) {
		this.unitprice = unitprice;
	}
	public Timestamp getTimestamp() {
		return timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		this.timestamp = timestamp;
	}
	
	

}
