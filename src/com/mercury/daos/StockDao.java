package com.mercury.daos;

import com.mercury.beans.Stock;
import com.mercury.beans.User;

public interface StockDao {
	public void add(Stock stock);
	public void delete(Stock stock);
	public void buy(User user, Stock stock);
	public void sell(User user, Stock stock);

}
