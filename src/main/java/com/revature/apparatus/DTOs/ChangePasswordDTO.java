package com.revature.apparatus.DTOs;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ChangePasswordDTO {
    private String oldPassword;
    private String newPassword;
}
