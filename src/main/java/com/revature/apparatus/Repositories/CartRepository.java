package com.revature.apparatus.Repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.revature.apparatus.Models.Cart;

public interface CartRepository extends JpaRepository<Cart, Integer> {

    // case insensitve search for input in product name or description
    // @Query("SELECT p FROM Product p WHERE lower(p.name) LIKE '%'||lower(?1)||'%' OR lower(p.description) LIKE '%'||lower(?1)||'%'")
    // Collection<Cart> search(String input);
    @Query("SELECT c FROM Cart c WHERE c.user_id=?1")
    Collection<Cart> getUserItems(int user_id);

    @Modifying
    @Query("DELETE FROM Cart item WHERE item.user_id=?1")
    Integer clearByUser(int user_id);
}
