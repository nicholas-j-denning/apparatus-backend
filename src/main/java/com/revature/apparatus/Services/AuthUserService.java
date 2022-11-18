package com.revature.apparatus.Services;

import javax.servlet.http.HttpServletRequest;

import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.apparatus.DTOs.ChangePasswordDTO;
import com.revature.apparatus.DTOs.UpdateProfileDTO;
import com.revature.apparatus.Exceptions.EmailIsReservedException;
import com.revature.apparatus.Exceptions.InvalidPasswordException;
import com.revature.apparatus.Models.User;
import com.revature.apparatus.Models.UserProfile;
import com.revature.apparatus.Repositories.UserProfileRepository;
import com.revature.apparatus.Repositories.UserRepository;
import com.revature.apparatus.Utilities.CookieParser;
import com.revature.apparatus.Utilities.JWT;
import com.revature.apparatus.Utilities.PasswordUtil;

import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.security.SignatureException;


@Service
@AllowSysOut
public class AuthUserService {
    
    @Autowired
    private UserProfileRepository userProfileRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CookieParser cookieParser;
    
    @Autowired
    private JWT jwt;


    public UserProfile updateProfile(UpdateProfileDTO updateProfileDTO, HttpServletRequest request) throws SignatureException, 
                    ExpiredJwtException, EmailIsReservedException  {
        
        String token = cookieParser.parseCookie(request.getCookies(), "token");
        User user = jwt.parseJWTtoUser(token);

        String emailToUpdate = updateProfileDTO.getEmail();

        if (!(emailToUpdate.equals(user.getEmail())) && userRepository.findByEmail(emailToUpdate) != null) {
            throw new EmailIsReservedException("The email has been already reserved by another user.");
        }

        user.updateUser(updateProfileDTO);
        userRepository.save(user);

        UserProfile userProfile = userProfileRepository.findByUser(user);

        if (userProfile == null) {
            userProfile = new UserProfile();
            userProfile.updateUserProfile(updateProfileDTO, user);
        } else {
            userProfile.updateUserProfile(updateProfileDTO, user);
        }

        return userProfileRepository.save(userProfile);
    }


    public UserProfile profile(HttpServletRequest request) throws SignatureException, ExpiredJwtException {
        String token = cookieParser.parseCookie(request.getCookies(), "token");
        User user = jwt.parseJWTtoUser(token);

        return userProfileRepository.findByUser(user);
    }

    public User changePassword(ChangePasswordDTO changePasswordDTO, HttpServletRequest request) throws InvalidPasswordException {
        String token = cookieParser.parseCookie(request.getCookies(), "token");
        User user = jwt.parseJWTtoUser(token);

        String providedCurrentPassword = PasswordUtil.generateEncryptedPassword(changePasswordDTO.getOldPassword(), user.getSalt());

        if (!user.getEncryptedPassword().equals(providedCurrentPassword)) 
            throw new InvalidPasswordException("The provided current password is wrong. Please provide correct password");
        
        user.setGenerateEncryptedPassword(changePasswordDTO.getNewPassword());
        user = userRepository.save(user);

        return user;
    }
}
