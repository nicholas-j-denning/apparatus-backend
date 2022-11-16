package com.revature.apparatus.Services;


import org.hibernate.internal.build.AllowSysOut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.revature.apparatus.DTOs.LoginDTO;
import com.revature.apparatus.DTOs.RegisterDTO;
import com.revature.apparatus.Exceptions.UserAlreadyExistsException;
import com.revature.apparatus.Exceptions.UserNotFoundException;
import com.revature.apparatus.Exceptions.WrongPasswordException;
import com.revature.apparatus.Models.User;
import com.revature.apparatus.Repositories.UserRepository;
import com.revature.apparatus.Utilities.PasswordUtil;

@Service
@AllowSysOut
public class UserService {

    @Autowired
    private UserRepository userRepository;

    public User login(LoginDTO loginDTO) throws UserNotFoundException, WrongPasswordException {
        User requestedUser = userRepository.findByEmail(loginDTO.getEmail());

        if (requestedUser == null) 
            throw new UserNotFoundException("A user was not found with " + loginDTO.getEmail() + " email.");

        if (!requestedUser.getEncryptedPassword().equals
                        (PasswordUtil.generateEncryptedPassword(loginDTO.getPassword(), requestedUser.getSalt())
        ))
            throw new WrongPasswordException("The user's email and password do not match.");  
        

        return requestedUser;
    }


    public User register(RegisterDTO registerDTO) throws UserAlreadyExistsException {

         if (userRepository.findByEmail(registerDTO.getEmail()) != null) {
            throw new UserAlreadyExistsException("The user with " + registerDTO.getEmail() + " email already exists");
         }
             

        return userRepository.save(User.toUser(registerDTO));
    }
}
