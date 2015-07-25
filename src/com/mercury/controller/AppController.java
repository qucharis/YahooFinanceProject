package com.mercury.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.beans.Stock;


@Controller
@RequestMapping("/app")
public class AppController {
/*
	@Autowired
	private ConfigService cfs;
	
	public ConfigService getCfs() {
		return cfs;
	}

	public void setCfs(ConfigService cfs) {
		this.cfs = cfs;
	}
	
	@Autowired
	private TraderService trader_s;
	
	
	public TraderService getTrader_s() {
		return trader_s;
	}

	public void setTrader_s(TraderService trader_s) {
		this.trader_s = trader_s;
	}
	
	@Autowired
	private StocksService stock_s;
	
	public StocksService getStock_s() {
		return stock_s;
	}

	public void setStock_s(StocksService stock_s) {
		this.stock_s = stock_s;
	}

	@RequestMapping("/config.htm")
	public ModelAndView config(Principal principal) {
		Trader trader = cfs.getCurrentTrader(principal.getName());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("app/config");
		mav.addObject("name", principal.getName());
		mav.addObject("trader", trader);
		return mav;
	}
	
	@RequestMapping(value="/config.htm", method = RequestMethod.POST)
	public ModelAndView makeConfig(HttpServletRequest request){
		int lid = Integer.parseInt(request.getParameter("c_lid"));
		String firstname = request.getParameter("c_firstname");
		String lastname = request.getParameter("c_lastname");
		String phone = request.getParameter("c_phone");
		String email = request.getParameter("c_email");
		String address = request.getParameter("c_address");
		String city = request.getParameter("c_city");
		String state = request.getParameter("c_state");
		String zipcode = request.getParameter("c_zipcode");
		cfs.config(lid, firstname, lastname, phone, 
				email, address, city, state, zipcode);
		return new ModelAndView("redirect:" + "config.htm");
	}
	*/
	@RequestMapping("/dashboard")
	public ModelAndView dashboard(){
		ModelAndView mav = new ModelAndView();
		String username=SecurityContextHolder.getContext().getAuthentication().getName();
		/*Trader trader = trader_s.getTrader(username);
		mav.addObject("shownName", 
				trader.getFirst_name());
		*/
		mav.setViewName("app/dashboard");
		return mav;
	}
	/*
	@RequestMapping(value="/stock.htm", method = RequestMethod.GET)
	public @ResponseBody Stock getStockInfo (HttpServletRequest  request){
		Stock stock = new Stock(request.getParameter("sid"));
		YahooFinance.getPrice(stock);
		return stock;
	}
	
	@RequestMapping("/password.htm")
	public ModelAndView password(Principal principal){
		Trader trader = cfs.getCurrentTrader(principal.getName());
		Login login = trader.getLogin();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("app/password");
		mav.addObject("trader", trader);
		mav.addObject("login", login);
		return mav;
	}
	
	@RequestMapping(value="/password.htm", method = RequestMethod.POST)
	public ModelAndView changePassword(HttpServletRequest request){
		int lid = Integer.parseInt(request.getParameter("c_lid"));
		System.out.println("........................lid: "+lid);
		String oldPwd = request.getParameter("c_password");
		String newPwd = request.getParameter("c_n_password");
		cfs.changePassword(lid, oldPwd, newPwd);
		return new ModelAndView("redirect:" + "password.htm");
	}
	
	@RequestMapping(value="/showMarketData.htm", method=RequestMethod.POST)
	public @ResponseBody List<Stock> showMarketData(ModelMap model) {
		System.out.println("showMarketData has been executed");
		List<Stock> stockList = new ArrayList<Stock>();
		List<Stocks> stocksSids = stock_s.getStocks();
		for(Stocks tempStock:stocksSids) {
			Stock stock = new Stock(tempStock.getSid());
			stockList.add(stock);
		}
		YahooFinance.marketData(stockList);
		return stockList;
	}
	*/
}
