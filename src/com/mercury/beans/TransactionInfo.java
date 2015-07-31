package com.mercury.beans;

import java.math.BigDecimal;
import java.sql.Timestamp;

public class TransactionInfo extends Transaction {
	private String time;
	
	public TransactionInfo() {
		super();
		time = null;
	}
	public TransactionInfo(int transid, User user, Stock stock, int amount,
			BigDecimal unitprice, Timestamp timestamp) {
		super(transid, user, stock, amount, unitprice, timestamp);
		time = timestamp.toString();
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
