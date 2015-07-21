package com.mercury.daos;

import java.util.*;

import com.mercury.beans.Stock;
import com.mercury.beans.User;

public interface StockDao {
	public void addStock(Stock stock);
	public void deleteStock(Stock stock);
	public Stock getStockByStockID(int sid);	
}
