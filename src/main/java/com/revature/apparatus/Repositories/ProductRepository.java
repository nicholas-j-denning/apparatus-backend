package com.revature.apparatus.Repositories;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.revature.apparatus.Models.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

    // case insensitve search for input in product name or description
    @Query("SELECT p FROM Product p WHERE lower(p.name) LIKE '%'||lower(?1)||'%' OR lower(p.description) LIKE '%'||lower(?1)||'%'")
    Collection<Product> search(String input);

    @Query("SELECT p FROM Product p WHERE p.price < p.normal_price")
    Collection<Product> getSaleProducts();
}
