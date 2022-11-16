package com.revature.apparatus;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ApparatusApplication {

	public static void main(String[] args) {
		SpringApplication.run(ApparatusApplication.class, args);
	}

	
	/*
	 * ResponseCookie authenticationCookie = ResponseCookie.from("token", jwt.createToken(user))
                .httpOnly(false)
                .secure(false)
                .path("/")
                .build();

            
            return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, authenticationCookie.toString()).body(user);
	 */
}
