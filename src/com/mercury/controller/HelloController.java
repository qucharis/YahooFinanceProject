package com.mercury.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Stock;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.daos.StockDao;
import com.mercury.daos.TransactionDao;
import com.mercury.daos.UserDao;
import com.mercury.services.UserService;


@Controller
@SessionAttributes
public class HelloController {
	@Autowired
	private TransactionDao td;
	@Autowired
	private StockDao sd;
	private UserService us;

	public UserService getUs() {
		return us;
	}

	public void setUs(UserService us) {
		this.us = us;
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
	
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(ModelMap model) {
		return "login";
	}

	@RequestMapping(value="/main", method = RequestMethod.GET)
	public ModelAndView mainPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("hello");
		mav.addObject("ownershipInfo", us.getOwnershipInfoByUserId(8));
		return mav;
	}
	
//	@RequestMapping(value="/main", method = RequestMethod.GET)
//	@ResponseBody
//	public String mainPage() {
//		StringBuffer sb = new StringBuffer();
//		for(Stock stock:us.ownsStocksByUserId(8)) {
//			//System.out.println(stock.toString());
//			sb.append(stock.getSid() + " " + stock.getScode());
//			sb.append("\n");
//		}
//		//return us.ownsStocksByUserId(8).toString();
//		return sb.toString();
//	}
}
