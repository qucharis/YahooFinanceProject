package com.mercury.daos;

import java.util.*;

import com.mercury.beans.Stock;
import com.mercury.beans.User;

public interface StockDao {
	public void addStock(Stock stock);
	public void deleteStock(Stock stock);
	public void buyStock(User user, Stock stock, int quantity);
	public void sellStock(User user, Stock stock, int quantity);
	public List<Stock> getStocksByUser(User user);	
}
