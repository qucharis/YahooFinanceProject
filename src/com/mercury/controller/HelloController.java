package com.mercury.controller;

import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Transaction;
import com.mercury.beans.User;
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
		
		User user1 = ud.getUserById(1);
		System.out.println(user1.getUserId() + user1.getUserName() + user1.getPassword());

		
		Set<Transaction> set = td.queryTransAll();
		System.out.println("*****************");
		for(Transaction t:set){
			System.out.println(t.getAmount()+";"+t.getTransid()+";"+t.getTimestamp()+";"+t.getUnitprice());
		}
		System.out.println("StockNames*******");
		for(Transaction t:set){
			System.out.println(t.getStock().toString());
			System.out.println(t.getUser().getUserName() +":"+t.getUser().getPassword());
		}
		return "hello";
	}
	
}
