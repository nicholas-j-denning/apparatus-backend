package com.revature.apparatus.Models;

import java.util.Arrays;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.revature.apparatus.DTOs.RegisterDTO;
import com.revature.apparatus.DTOs.UpdateProfileDTO;
import com.revature.apparatus.Utilities.PasswordUtil;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "users")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String encryptedPassword;
    private byte[] salt = PasswordUtil.generatePasswordSalt();

    @OneToOne(cascade = CascadeType.ALL, mappedBy = "user")
    @JsonIgnore
    private UserProfile userProfile;

    public void setGenerateEncryptedPassword(String password) {
        this.encryptedPassword = PasswordUtil.generateEncryptedPassword(password, salt);
    }

    public void updateUser(UpdateProfileDTO updateProfileDTO) {
        setFirstName(updateProfileDTO.getFirstName());
        setLastName(updateProfileDTO.getLastName());
        setEmail(updateProfileDTO.getEmail());
    }

    static public User toUser(RegisterDTO registerDTO) {
        User user = new User();

        user.setFirstName(registerDTO.getFirstName());
        user.setLastName(registerDTO.getLastName());
        user.setEmail(registerDTO.getEmail());
        user.setGenerateEncryptedPassword(registerDTO.getPassword());

        return user;
    }

    @Override
    public String toString() {
        return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
                + ", encryptedPassword=" + encryptedPassword + ", salt=" + Arrays.toString(salt) + "]";
    }
    
}
