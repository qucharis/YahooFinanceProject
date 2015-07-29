package com.mercury.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.FormParam;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.services.RegisterService;

@Controller
public class RegisterController {
	@Resource
	//private boolean isUserExisted;
	private RegisterService rs;
	
	@RequestMapping(value="/validate", method=RequestMethod.POST)
	@ResponseBody
	public boolean isUserExisted(@FormParam("r_username") String name) {
		System.out.println(name + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		if(rs.isUserExist(name)) {
			System.out.println("name existeddd...........................");
			return true;
		}
		return false;
	}
}
