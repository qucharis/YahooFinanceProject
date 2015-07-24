package com.mercury.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.daos.StockDao;
import com.mercury.daos.TransactionDao;
import com.mercury.daos.UserDao;

@Controller
@SessionAttributes
public class HelloController {
	@Autowired
	private TransactionDao td;
	@Autowired
	private StockDao sd;
	@Autowired
	private UserDao ud;

	public UserDao getUd() {
		return ud;
	}

	public void setUd(UserDao ud) {
		this.ud = ud;
	}

	public TransactionDao getTd() {
		return td;
	}

	public void setTd(TransactionDao td) {
		this.td = td;
	}
	
	public StockDao getSd() {
		return sd;
	}

	public void setSd(StockDao sd) {
		this.sd = sd;
	}
	
/*	@RequestMapping(value="/hello", method=RequestMethod.POST)
	public ModelAndView process(@ModelAttribute("user") 
			User user, BindingResult result) {
		UserInfo userInfo = hs.process(user);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewPage);
		mav.addObject("userInfo", userInfo);
		return mav;
	}*/

	

	@RequestMapping("/test")
	public String test(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("alice");
		return "alive";
	}

	@RequestMapping("/main")
	@ResponseBody
	public String mainPage() {	
		
		/*Stock stock = new Stock("yahoo", "yo");
		sd.addStock(stock);
		

		User user = new User(10000,"qwer","123","abc@gmail.com",new BigDecimal(10),"admin",0);
		ud.save(user);
		Transaction tran = new Transaction(user,stock);
		td.addTrans(tran);*/

		//User user = new User(10000,"qwer","123","abc@gmail.com",new BigDecimal(10),"admin",0);
		String opStr = new String();
		
		/*User user1 = ud.getUserById(16);
		opStr = user1.getUserId() + user1.getUserName() + user1.getPassword() +"<br/>";*/

		/***************test stock impl******************/
		Stock stock1 = new Stock("yahoo", "yaho");
		Stock stock2 = new Stock("google", "gogl");
		Stock stock3 = new Stock("amazon", "amzn");
		sd.addStock(stock1);
		sd.addStock(stock2);
		sd.addStock(stock3);
		for(Stock stock:sd.queryAll()) {
			System.out.println(stock.getSid() + " " + stock.getScode() + stock.getStockName());
		}
		/************************************************/
		
		Set<Transaction> set = td.queryTransAll();
		for(Transaction t:set){
			opStr = opStr+(t.getAmount()+";"+t.getTransid()+";"+t.getTimestamp()+";"+t.getUnitprice())+"<br/>";			
			opStr = opStr+t.getStock().toString()+"<br/>";
			opStr = opStr+t.getUser().getUserName() +":"+t.getUser().getPassword()+"<br/>";
			
			opStr = opStr+"<br/><br/>";
		}
		return opStr;
	}
	
}
