package com.mercury.daoimpl;

import java.sql.Date;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.TransactionInfo;
import com.mercury.beans.User;
import com.mercury.daos.TransactionDao;

public class TransactionDaoImpl implements TransactionDao {

	@Override
	public void addTrans(Stock stock, User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public TransactionInfo queryTransAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionInfo queryTrans(User user) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionInfo queryTrans(Stock stock) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionInfo queryTrans(User user, Date date) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionInfo queryTrans(User user, Stock stock) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionInfo queryTrans(Date date, Stock stock) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TransactionInfo queryTrans(User user, Date date, Stock stock) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteTrans(Transaction trans) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteTrans(User user) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteTrans(Stock stock) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteTrans(User user, Stock stock) {
		// TODO Auto-generated method stub

	}

}
