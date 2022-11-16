package com.revature.apparatus.Controllers;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.function.ServerResponse.HeadersBuilder;

import com.revature.apparatus.DTOs.LoginDTO;
import com.revature.apparatus.DTOs.RegisterDTO;
import com.revature.apparatus.Exceptions.UserAlreadyExistsException;
import com.revature.apparatus.Exceptions.UserNotFoundException;
import com.revature.apparatus.Exceptions.WrongPasswordException;
import com.revature.apparatus.Models.User;
import com.revature.apparatus.Services.UserService;
import com.revature.apparatus.Utilities.JWT;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;


@RestController
@RequestMapping(path="/user")
@CrossOrigin(origins = "http://localhost:4200/", allowCredentials = "true")
@AllowSysOut
public class UserController {

    private class Message {
        public String message;

        public Message(String message) {
            this.message = message;
        }
    }
   
    @Autowired
    private UserService userService;

    @Autowired
    private JWT jwt;

    @PostMapping(path="/login", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Object> login(HttpServletResponse response, @RequestBody LoginDTO credentials) {
        try {
            User user = userService.login(credentials);
            
            ResponseCookie authenticationCookie = ResponseCookie.from("token", jwt.createToken(user))
                .httpOnly(false)
                .secure(false)
                .path("/")
                .build();
            
            return ResponseEntity.ok().header(HttpHeaders.SET_COOKIE, authenticationCookie.toString()).body(user);
        } catch (UserNotFoundException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (WrongPasswordException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body("Something went critically wrong.");
        }
    }


    @PostMapping(path="/register", consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Message> register(@RequestBody RegisterDTO registerDTO) {
        try {
            userService.register(registerDTO);
            return ResponseEntity.ok(new Message("The user is successfully register!"));
        } catch (UserAlreadyExistsException e) {
            return ResponseEntity.badRequest().body(new Message(e.getMessage()));
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.badRequest().body(new Message(e.getMessage()));
        } 
    }


    @GetMapping(path="/logout")
    public ResponseEntity<Message> logout(@RequestHeader(value = "Cookie") String header,HttpServletRequest request, HttpServletResponse response) {
        try {
            Cookie deleteCookie = new Cookie("token", null);
            deleteCookie.setMaxAge(0);

            response.addCookie(deleteCookie);
            return ResponseEntity.ok(new Message("Good bye!"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new Message(e.getMessage()));
        } 
    }


}
