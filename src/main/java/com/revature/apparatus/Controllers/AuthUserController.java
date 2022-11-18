package com.revature.apparatus.Controllers;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseCookie;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.revature.apparatus.DTOs.ChangePasswordDTO;
import com.revature.apparatus.DTOs.UpdateProfileDTO;
import com.revature.apparatus.Exceptions.EmailIsReservedException;
import com.revature.apparatus.Exceptions.InvalidPasswordException;
import com.revature.apparatus.Interface.AuthenticatedUser;
import com.revature.apparatus.Models.Message;
import com.revature.apparatus.Models.User;
import com.revature.apparatus.Models.UserProfile;
import com.revature.apparatus.Services.AuthUserService;
import com.revature.apparatus.Utilities.JWT;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.security.SignatureException;

@RestController
@RequestMapping(path="/user/auth")
@CrossOrigin(origins = "http://localhost:4200/", allowCredentials = "true")
@AuthenticatedUser
public class AuthUserController {

    @Autowired
    private AuthUserService authUserService;

    @Autowired
    private JWT jwt;
    
    @PostMapping("/update-profile")
    public ResponseEntity<Object> updateProfile(@RequestBody UpdateProfileDTO updateProfileDTO, HttpServletRequest request) {
        try {
            return ResponseEntity.ok(authUserService.updateProfile(updateProfileDTO, request));
        } catch (SignatureException | ExpiredJwtException e) {
            return ResponseEntity.badRequest().body(new Message("The session has been expired. Please reload a page and login again."));
        } catch (EmailIsReservedException e) {
            return ResponseEntity.badRequest().body(new Message(e.getMessage()));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new Message(e.getMessage()));  
        }
    }


    @GetMapping("/profile")
    public ResponseEntity<Object> profile(HttpServletRequest request) {
        UserProfile userProfile = null;
        try {
            userProfile = authUserService.profile(request);
            return (userProfile == null) ? ResponseEntity.badRequest().body(new Message("The profile has not been found.")) :
                                           ResponseEntity.ok(userProfile); 
        } catch (SignatureException | ExpiredJwtException e) {
            return ResponseEntity.badRequest().body(new Message("The session has been expired. Please reload a page and login again."));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new Message("Something went wrong with the profile."));
        }
    }

    @PostMapping("/change-password")
    public ResponseEntity<Object> changePassword(@RequestBody ChangePasswordDTO changePasswordDTO, HttpServletRequest request) {
        try {
            User user = authUserService.changePassword(changePasswordDTO, request);
            
            ResponseCookie updateCookie = ResponseCookie.from("token", jwt.createToken(user))
                .httpOnly(false)
                .secure(false)
                .path("/")
                .build();
            
            return ResponseEntity.ok()
                                 .header(HttpHeaders.SET_COOKIE, updateCookie.toString())
                                 .body(new Message("The password is successfully changed."));
        } catch (InvalidPasswordException e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        } catch (SignatureException | ExpiredJwtException e) {
            return ResponseEntity.badRequest().body(new Message("The session has been expired. Please reload a page and login again."));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(new Message("Something went wrong with the change password."));
        }
    }


}
