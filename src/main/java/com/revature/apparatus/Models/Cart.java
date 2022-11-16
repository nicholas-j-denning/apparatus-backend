package com.revature.apparatus.Models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity
public class Cart {
    @Id
    @GeneratedValue
    private int id;
    private int user_id;
    private int product_id;

    public Cart(int user_id, int product_id) {
        this.user_id = user_id;
        this.product_id = product_id;
    }
    
    public int getId() {
        return this.id;
    }

    public void setId(int id) {
        this.id = id;
    }
    
    public int getUserId() {
        return this.user_id;
    }

    public void setUserId(int user_id) {
        this.user_id = user_id;
    }

    public int getProductId() {
        return this.product_id;
    }

    public void setProductId(int product_id) {
        this.product_id = product_id;
    }
}
