package com.revature.apparatus.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.revature.apparatus.DTOs.RegisterDTO;
import com.revature.apparatus.Utilities.PasswordUtil;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity()
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String encryptedPassword;
    private byte[] salt = PasswordUtil.generatePasswordSalt();

    public void setEncryptedPassword(String password) {
        this.encryptedPassword = PasswordUtil.generateEncryptedPassword(password, salt);
    }

    static public User toUser(RegisterDTO registerDTO) {
        User user = new User();

        user.setFirstName(registerDTO.getFirstName());
        user.setLastName(registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setEncryptedPassword(registerDTO.getPassword());

        return user;
    }
    
}
