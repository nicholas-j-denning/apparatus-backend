package com.revature.apparatus.Controllers;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(path="/user/auth")
@CrossOrigin(origins = "http://localhost:4200/", allowCredentials = "true")
@AllowSysOut
public class AuthenticatedUserController {
    
    @GetMapping("/hello")
    public Object sayHello(HttpServletRequest request) {
        return "hello";
    }
}
