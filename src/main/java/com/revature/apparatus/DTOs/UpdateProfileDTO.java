package com.revature.apparatus.DTOs;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class UpdateProfileDTO {
    private String firstName;
    private String lastName;
    private String gender;
    private String dob;
    private String email;
    private String phoneNumber;
}
