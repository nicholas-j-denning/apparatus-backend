package com.revature.apparatus;

import javax.servlet.http.Cookie;

import org.apache.catalina.connector.RequestFacade;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.CodeSignature;
import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestHeader;

import com.revature.apparatus.Models.Message;
import com.revature.apparatus.Utilities.JWT;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.security.SignatureException;

@Aspect
@Component
public class AuthAspect {

    @Autowired
    private JWT jwt;

    @Pointcut(value = "@annotation(com.revature.apparatus.Interface.AuthenticatedUser)")
    public void targetForAuthentication(){};

    @Around("targetForAuthentication()")
    public Object validateJWT(ProceedingJoinPoint pjp) {
        Object returnedObject = null;
        Object[] args = pjp.getArgs();
        String token = null;
        
        RequestFacade requestFacade = (RequestFacade) args[0];
        Cookie[] cookies =  requestFacade.getCookies();

        if (cookies != null) {    
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) token = cookie.getValue();
            }
            
            if (token != null) {
                try {
                    jwt.parseJWTtoUser(token);
                    returnedObject = pjp.proceed();
                    return returnedObject;
                } catch (MalformedJwtException e) {

                } catch (SignatureException e) {
                    
                } catch (ExpiredJwtException e) {
                    
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        }

        return ResponseEntity.badRequest().body(new Message("The user is not authenticated"));
    }
}
