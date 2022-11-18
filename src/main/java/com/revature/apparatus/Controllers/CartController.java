package com.revature.apparatus.Controllers;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestBody;

import com.revature.apparatus.Models.Cart;
import com.revature.apparatus.Models.Product;
//import com.revature.apparatus.Models.Search;
import com.revature.apparatus.Repositories.CartRepository;
import com.revature.apparatus.Repositories.ProductRepository;

@CrossOrigin(origins = "http://localhost:4200")
@RestController
@RequestMapping(path="/cart")
public class CartController {

    @Autowired
    private CartRepository cartRepository;
    @Autowired
    private ProductRepository productRepository;

    @GetMapping(path="/all")
    public Iterable<Cart> getAllCartItems() {
        return cartRepository.findAll();
    }

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

    @PostMapping(path = "/add/{userID}/{productID}/{quantity}")
    public void addCartItemMultiple(@PathVariable int userID, @PathVariable int productID, @PathVariable int quantity){
        for(int i = 0; i < quantity; i++){
            Cart item = new Cart(userID, productID);
            cartRepository.save(item);}
        }

    @GetMapping(path="/find/{user_id}")
    public List<Product> getUserItems(@PathVariable Integer user_id){
        Collection<Cart> collection = cartRepository.getUserItems(user_id);
        List<Product> products = new LinkedList<Product>();
        for(Cart cart: collection) {
            Optional<Product> op = productRepository.findById(cart.getProductId());
            products.add(op.get());
        }
        return products;
    }

    @GetMapping(path="/total/{user_id}")
    public float getTotal(@PathVariable Integer user_id) {
        Collection<Cart> collection = cartRepository.getUserItems(user_id);
        float total = 0.00f;
        for(Cart cart: collection) {
            Optional<Product> op = productRepository.findById(cart.getProductId());
            total += op.get().getPrice();
        }
        return total;
    }

}



