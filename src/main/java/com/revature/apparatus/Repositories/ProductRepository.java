package com.revature.apparatus.Repositories;

import org.springframework.data.repository.CrudRepository;

import com.revature.apparatus.Models.Product;

public interface ProductRepository extends CrudRepository<Product, Integer> {

}
