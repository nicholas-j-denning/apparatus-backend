package com.revature.apparatus;

import javax.servlet.http.Cookie;

import org.apache.catalina.connector.RequestFacade;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;

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
        RequestFacade requestFacade = null;
        String token = null;
        Cookie[] cookies = null;

        Object[] args = pjp.getArgs();
        
        /* Finds a header of request */
        for (Object arg : args) {
            if (arg.getClass() == RequestFacade.class) requestFacade = (RequestFacade) arg;
        }

        /* If the header was found, extract cookies*/
        if (requestFacade != null) cookies =  requestFacade.getCookies();

        /* If there is any cookie, it looks for token (JWT) */
        if (cookies != null) {    
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("token")) token = cookie.getValue();
            }
            
            if (token != null) {
                try {
                    jwt.parseJWTtoUser(token);
                    returnedObject = pjp.proceed();
                    return returnedObject;
                } catch (MalformedJwtException | SignatureException | ExpiredJwtException e) {
                    /* There is no need to care about invalid JWT token, just return result that a user is not authenticated */
                } catch (Throwable e) {
                    e.printStackTrace();
                }
            }
        }

        return ResponseEntity.badRequest().body(new Message("The user is not authenticated"));
    }
}
