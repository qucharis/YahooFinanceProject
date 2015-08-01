package com.mercury.controller;


import java.util.List;

import javax.annotation.Resource;
import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mercury.services.RegisterService;

//@Path("/registervalidation")
@Controller
public class RegisterController {
	@Resource
	//private boolean isUserExisted;
	private RegisterService rs;
	
	/*@RequestMapping(value="/validate", method=RequestMethod.POST)
	@ResponseBody
	public boolean isUserExisted(@FormParam("name") String name) {
		System.out.println(name + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		if(rs.isUserExist(name)) {
			System.out.println("name existeddd...........................");
			return true;
		}
		return false;
	}*/
	//@POST
	//@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	@RequestMapping(value="/registervalidation", method=RequestMethod.POST)
	@ResponseBody
	public String isUserExist(@FormParam(value="name") String name) {
		System.out.println(name + "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		if(rs.isUserExist(name)) {
			System.out.println("name existeddd...........................");
			return "true";
		}
		return "false";
	}
}
