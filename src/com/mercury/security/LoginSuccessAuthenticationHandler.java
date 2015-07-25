package com.mercury.security;

import java.io.IOException;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

public class LoginSuccessAuthenticationHandler extends SavedRequestAwareAuthenticationSuccessHandler  {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
            Authentication authentication) throws ServletException, IOException {
		System.out.println("in LoginSuccessAuthenticationHandler.....................");
		String userTargetUrl = "/app/dashboard.html";
		String adminTargetUrl = "/admin/admin.html";
		Set<String> roles = AuthorityUtils.authorityListToSet(authentication.getAuthorities());
		if(roles.contains("ROLE_ADMIN")){
			System.out.println("redirect to /admin/admin.html");
			getRedirectStrategy().sendRedirect(request, response, adminTargetUrl);
		} else if(roles.contains("ROLE_USER")){
			System.out.println("redirect to /app/dashboard.html");
			getRedirectStrategy().sendRedirect(request, response, userTargetUrl);
		} else {
			System.out.println("??????????????????????????????????????");
			super.onAuthenticationSuccess(request, response, authentication);
			return;
		}
   }
}
