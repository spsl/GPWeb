package com.sunsai.graduation.security;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Map;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.google.gson.Gson;

public class AuthenticationUtility {
	private static final Logger logger = LoggerFactory.getLogger(AuthenticationUtility.class);
	
	private static AuthenticationUtility s_instance = new AuthenticationUtility();
	public static final int COOKIE_EXPIRED_PERSESSION = 0;
	public static final int COOKIE_EXPIRED_THREE_MONTH = 1;
	public static final int COOKIE_EXPIRED_NEVER = 2;

	public static final int PER_SESSION = -1;
	public static final int THREE_MONTH_SECOND = 60 * 60 * 24 * 30;
	public static final int FOREVER_SECOND = 60 * 60 * 24 * 365*30;// 30 years
	
	private static String IDENTITY_COOKIE_NAME = "identity";
	
	public static AuthenticationUtility instance(){
		return s_instance;
	}
	
	public boolean isAuthenticated(HttpServletRequest request){
		Identity currentIdentity = currentIdentity(request);
		return currentIdentity!=null;
	}
	
	public void setIdentity(Identity userIdentity, HttpServletResponse response, int expriedType){
		// TODO NEED IMPLEMENTATION
		Gson gsonSerializer = new Gson();
		
		try {
			Cookie identityTypeCookie = new Cookie(IDENTITY_COOKIE_NAME, URLEncoder.encode(gsonSerializer.toJson(userIdentity), "UTF-8"));
			identityTypeCookie.setMaxAge(getExpiryTime(expriedType));
			identityTypeCookie.setPath("/");
			response.addCookie(identityTypeCookie);
		} catch (UnsupportedEncodingException e) {
			logger.error(e.getMessage());
		}			
	}
	
	public void clearIdentity(HttpServletResponse response){
		Cookie identityTypeCookie = new Cookie(IDENTITY_COOKIE_NAME, null);
		identityTypeCookie.setPath("/");
		response.addCookie(identityTypeCookie);
	}
	
	public Identity currentIdentity(HttpServletRequest request){
		Cookie[] cookies = request.getCookies();
		Gson gson = new Gson();
		if (cookies == null)
			return null;
		for (Cookie cookie : cookies) {
			if(cookie.getName().equalsIgnoreCase(IDENTITY_COOKIE_NAME))
			try {
				String userToken = URLDecoder.decode(cookie.getValue(), "UTF-8");
				return gson.fromJson(userToken, Identity.class);
			}catch(Exception e){
				logger.error(e.getMessage());
			}
		}
		
		return null;
	}

	public int getExpiryTime(int type) {
		switch (type) {
		case COOKIE_EXPIRED_THREE_MONTH:
			return THREE_MONTH_SECOND;
		case COOKIE_EXPIRED_NEVER:
			return FOREVER_SECOND;
		default:
			return PER_SESSION;
		}
	}
	
	public void populateAuthenticationInfo(HttpServletRequest request, Map<String, Object> model){
		if(model==null){
			return;
		}

		Identity identity = currentIdentity(request);

		model.put("userAuthenticated", identity != null);
		model.put("userIdentity", identity);
	}
}
