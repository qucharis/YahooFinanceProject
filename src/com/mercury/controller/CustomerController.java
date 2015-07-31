package com.mercury.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.mercury.beans.Ownership;
import com.mercury.beans.Stock;
import com.mercury.beans.StockInfo;
import com.mercury.beans.Transaction;
import com.mercury.beans.User;
import com.mercury.daos.StockDao;
import com.mercury.daos.TransactionDao;
import com.mercury.daos.UserDao;
import com.mercury.services.CustomerService;
import com.mercury.services.StockService;
import com.mercury.services.TransactionService;
import com.mercury.services.UserService;

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
	@Autowired
	private CustomerService cs;
	@Autowired
	private UserService us;

	@RequestMapping(value="/addBal", method=RequestMethod.POST)
	@ResponseBody
	public BigDecimal addBalance(@FormParam("amount") BigDecimal amount) {
		String userName = SecurityContextHolder.getContext().getAuthentication().getName();
		//System.out.println(amount);
		//if()
		us.addBalance(userName, amount);
		return us.getBalance(userName);
	}
	
	@RequestMapping(value="/buySub", method=RequestMethod.POST)
	@ResponseBody
	public String BuyingSubmmition(@FormParam("code") String code,@FormParam("amount") Integer amount) {
		User user = ud.getUserById(16);
		code = code.toUpperCase();
		System.out.println(code);
		System.out.println("abc");
		System.out.println(code + amount);
		if (ss.getStockInfoBCode(code)==null){
			return "The Stock is NOT in the System";
			
		}else if(amount*ss.getStockInfoBCode(code).getCurrentPrice()>= user.getBalance().doubleValue()) {
			return "Your credit is NOT enough";
			
		}else{
			StockInfo stockInfo = ss.getStockInfoBCode(code);
			cs.requestExchange(stockInfo, user, amount);
			return "Transaction Added";
		}
		
	}
	
	@RequestMapping(value="/sellSub", method=RequestMethod.POST)
	@ResponseBody
	public String sellingSubmmition(@FormParam("code") String code,@FormParam("amount") Integer amount) {
		User user = ud.getUserById(16);
		code = code.toUpperCase();
		System.out.println(code);
		System.out.println("abc");
		System.out.println(code + amount);
		Set<Ownership> set=us.getOwnershipInfoByUser(user).getOwnerships();
		Stock stock = null;
		Ownership os = new Ownership();
		for (Ownership o:set){
			if (o.getStock().getScode().equals(code)){
				stock = o.getStock();
				os = o;
				break;
			}
		}
		if (stock==null){
			return "You don't have This Stock";
		}else if(amount>os.getQuantity()) {
			return "You don't have that much of "+stock.getScode();
			
		}else{
			StockInfo stockInfo = ss.getStockInfoBCode(code);
			cs.requestExchange(stockInfo, user,-amount);
			return "Transaction Added";
		}
		
	}
	
	
	
	@RequestMapping("/check_bs")
	public ModelAndView checkBuyAndSell(HttpServletRequest request){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("transaction");
		return mav;
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
