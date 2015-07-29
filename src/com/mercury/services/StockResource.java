package com.mercury.services;

import java.util.ArrayList;

import javax.ws.rs.FormParam;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.mercury.beans.StockInfo;
import com.mercury.beans.Stock;

@Path("/register")
public class StockResource {
	private RegisterService rs;

	@POST
	@Produces({MediaType.APPLICATION_XML, MediaType.APPLICATION_JSON})
	public String execute(
			@FormParam("r_username") String name) {
		System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
		rs  = new RegisterService();
		if(rs.isUserExist(name)) {
			return "true";
		}
		return "false";
	}
}
