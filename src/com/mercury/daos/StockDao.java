package com.mercury.daos;


import com.mercury.beans.Stock;

public interface StockDao {
	public void addStock(Stock stock);
	public void deleteStock(Stock stock);
	public Stock getStockByStockID(int sid);	
}
