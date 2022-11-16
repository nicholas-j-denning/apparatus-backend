package com.revature.apparatus.Utilities;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import io.jsonwebtoken.security.SignatureException;
import io.jsonwebtoken.jackson.io.JacksonDeserializer;
import io.jsonwebtoken.lang.Maps;

import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Date;

import javax.crypto.SecretKey;

import org.springframework.stereotype.Component;

import com.revature.apparatus.Models.User;

@Component
public class JWT {

    private String secretKey = "dsfsdgfsdvdcESAVDSVCdadvadrsdcadbgffdfabds";

    private SecretKey key = Keys.hmacShaKeyFor(secretKey.getBytes());
    

    public String createToken(User user) {
        Instant now = Instant.now();

        String jws = Jwts.builder()
                         .setIssuer("server")
                         .setSubject("token")
                         .setAudience("users")
                         .claim("user", user)
                         .setIssuedAt(Date.from(now))
                         .setExpiration(Date.from(now.plus(20, ChronoUnit.MINUTES)))
                         .signWith(key)
                         .compact();
        return jws;
    }



    public User parseJWTtoUser(String jws) throws SignatureException, ExpiredJwtException {
        User result = Jwts.parserBuilder()
                        .setSigningKey(key)
                        .deserializeJsonWith(new JacksonDeserializer(Maps.of("user", User.class).build()))
                        .build()
                        .parseClaimsJws(jws)
                        .getBody()
                        .get("user", User.class);

        return result; 
    }

}
