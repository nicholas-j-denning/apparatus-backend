package com.revature.apparatus.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revature.apparatus.Models.User;
import com.revature.apparatus.Models.UserProfile;

public interface UserProfileRepository extends JpaRepository<UserProfile, Integer> {
    public UserProfile findByUser(User user);
}
