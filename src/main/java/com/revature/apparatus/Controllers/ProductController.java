package com.revature.apparatus.Controllers;

import java.util.Optional;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;

import com.revature.apparatus.Models.Product;
import com.revature.apparatus.Models.Search;
import com.revature.apparatus.Repositories.ProductRepository;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping(path="/product")
public class ProductController {

    @Autowired
    private ProductRepository productRepository;

    @GetMapping(path="/all")
    public Iterable<Product> getAllProducts() {
        return productRepository.findAll();
    }

    @GetMapping(path="/id/{id}")
    public Optional<Product> getProductById(@PathVariable Integer id) {
        return productRepository.findById(id);
    }

    // to use this endpoint send JSON {"input":"seach string goes here"}
    @GetMapping(path="/search")
    public Iterable<Product> getSearchResults(@RequestBody Search search) {
        return productRepository.search(search.getInput());
    }
    
}