package com.revature.apparatus.Repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.revature.apparatus.Models.Product;

public interface ProductRepository extends JpaRepository<Product, Integer> {

}
