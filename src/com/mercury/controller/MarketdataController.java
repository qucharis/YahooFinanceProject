package com.mercury.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.services.StockService;

@Controller
@SessionAttributes
public class MarketdataController {
	@Autowired
	private StockService ss;

	private Set<StockInfo> stocks;	//collection autowire cannot work, need to use resource
	
	public StockService getSs() {
		return ss;
	}

	public void setSs(StockService ss) {
		this.ss = ss;
	}

	@RequestMapping(value="/market", method=RequestMethod.GET)
	@ResponseBody
	public Set<StockInfo> marketData() {
		stocks = ss.getInfo(ss.getAllStocks());
/*		for(StockInfo stock:stocks) {
			System.out.println(stock.getScode() + " " + stock.getCurrentPrice());
		}*/
		return stocks;
	}
	
	@RequestMapping(value="/addstock", method=RequestMethod.POST)
	@ResponseBody	//return a message instead of of view
	public String addstock(@ModelAttribute("stock") 
			Stock stock, BindingResult result) {
		stock.setScode(stock.getScode().toUpperCase());
		System.out.println(stock.toString());
		if(!(ss.isExisted(stock))) {
			ss.addStock(stock);
			return "Add Successfully";
		}
		else return "This stock is already added";
	}
	
	@RequestMapping(value="/removestock", method=RequestMethod.POST)
	@ResponseBody	//return a message instead of a view
	public String removestock(@ModelAttribute("stock") 
			Stock stock, BindingResult result) {
		stock.setScode(stock.getScode().toUpperCase());
		if(ss.isExisted(stock)) {
			//System.out.println(stock.toString());
			ss.deleteStock(ss.getStockByScode(stock.getScode()));
			return "Remove Successfully";
		}
		else return "This stock is not existed";
	}
}
