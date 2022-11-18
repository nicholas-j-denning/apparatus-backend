package com.revature.apparatus.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.revature.apparatus.DTOs.UpdateProfileDTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Entity
@Table(name = "profile")
public class UserProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String phoneNumber;
    private String gender;
    private String dob;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    public void updateUserProfile(UpdateProfileDTO updateProfileDTO, User user){
        setPhoneNumber(updateProfileDTO.getPhoneNumber());
        setGender(updateProfileDTO.getGender());
        setDob(updateProfileDTO.getDob());
        setUser(user);
    }

}
