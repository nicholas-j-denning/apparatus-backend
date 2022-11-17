package com.revature.apparatus.Controllers;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.revature.apparatus.Interface.AuthenticatedUser;
import com.revature.apparatus.Models.Cart;
//import com.revature.apparatus.Models.Search;
import com.revature.apparatus.Repositories.CartRepository;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping(path="/cart")
public class CartController {

    @Autowired
    private CartRepository cartRepository;

    @GetMapping(path="/all")
    public Iterable<Cart> getAllCartItems() {
        return cartRepository.findAll();
    }

    @AuthenticatedUser
    @CrossOrigin(origins = "http://localhost:4200", allowCredentials = "true")
    @PostMapping(path="/add/{user_id}/{product_id}")
    public Cart addCartItem(@PathVariable int user_id, @PathVariable int product_id){
        // Create JSON object here
        /*for(int i = 0; i < 50; i++) {
            System.out.println(user_id + " " + product_id);
        }*/
        Cart item = new Cart(user_id, product_id);
        return cartRepository.save(item);
    }
    
    //create function to loop through list of cart objects
    //for each cart object, call productRepository.findItemById(product_id)


}
