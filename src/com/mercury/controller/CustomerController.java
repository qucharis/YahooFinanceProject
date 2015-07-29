package com.mercury.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.StockInfo;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.daos.StockDao;
import com.mercury.daos.TransactionDao;
import com.mercury.daos.UserDao;
import com.mercury.services.StockService;
import com.mercury.services.TransactionService;

@Controller
@SessionAttributes
public class CustomerController {
	@Autowired
	private TransactionDao td;
	@Autowired
	private StockDao sd;
	@Autowired
	private UserDao ud;
	@Autowired
	private TransactionService tranSS;
	@Autowired
	private StockService ss;

	@RequestMapping("/addTran")
	@ResponseBody
	public String TransactionSubmmition() {

		return null;
	}

	@RequestMapping("/checkStock")
	public ModelAndView checkStock(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("piechart");
		User user = ud.getUserById(16);
		Set<Transaction> trans = user.getTransactions();
		List<StockInfo> infos = new ArrayList<StockInfo>();

		for (Transaction t : trans) {
			StockInfo si = ss.getInfo(t.getStock());
			si.setAmount(t.getAmount());
			infos.add(si);
		}
		mav.addObject("stockInfos", infos);
		return mav;
	}
}
