package com.revature.apparatus.Utilities;

import javax.servlet.http.Cookie;

import org.springframework.stereotype.Component;

@Component
public class CookieParser {
    

    public String parseCookie(Cookie[] cookies, String cookieName) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(cookieName)) {
                return cookie.getValue();
            }
        }

        return null;
    }
}
