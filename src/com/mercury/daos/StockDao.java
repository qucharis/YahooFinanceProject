package com.mercury.daos;

import com.mercury.beans.Stock;

public interface StockDao {
	public void save(Stock stock);
	public void update(Stock stock);
	public void delete(Stock stock);
}
