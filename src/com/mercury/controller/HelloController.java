package com.mercury.controller;

import java.math.BigDecimal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Ownership;
import com.mercury.beans.Stock;
import com.mercury.beans.User;
import com.mercury.daos.StockDao;
import com.mercury.daos.TransactionDao;

@Controller
@SessionAttributes
public class HelloController {
	private TransactionDao td;
	private StockDao sd;
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
		
		Stock stock = new Stock("google", "goo");
		//sd.addStock(stock);
		
		User user = new User(10000,"qwer","123","abc@gmail.com",new BigDecimal(10),"admin",0);
	
		td.addUser(user);
		
		Ownership ownership = new Ownership();
		ownership.setQuantity(10);
		ownership.setStock(stock);
		stock.addOwnership(ownership);
		sd.addStock(stock);
		Stock stock1 = sd.getStockByStockID(2);
		
		return stock1.getScode() + stock1.getStockName();
	}
	
}
