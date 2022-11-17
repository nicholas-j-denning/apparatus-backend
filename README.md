# Apparatus E-Commerce Site Backend

## Dependencies

- PostgreSQL
- JDK
- Maven

## Installation and Running Locally

1. Clone the frontend repository at https://github.com/Vlad-Mel/Project-2---Client-Side
2. Clone this repository
3. Start a Posgres instance
4. Execute the databaseSetup.sql script to initialize the database (You can use DBeaver for this)
5. Create a folder src/main/resources 
6. Add an application.properties file to that folder like this, but with your local database url, username, and password
```
spring.jpa.hibernate.ddl-auto=update
spring.datasource.url=jdbc:postgresql://localhost:5432/postgres
spring.datasource.username=postgres
spring.datasource.password=password
spring.datasource.driver-class-name=org.postgresql.Driver
```
7. Run the application on port 8080 with your IDE or with "mvn spring-boot:run" on the command line in the project root directory
8. Run the frontend according to the README in the frontend repo

## Endpoints
### GET localhost:8080/product/all
Returns a list of all products as JSON, including product id, name, description, normal_price, price, category, and image_url
### GET localhost:8080/product/id/{id}
Replace {id} with a valid product id number. Returns JSON with product id, name, description, normal_price, price, category, and image_url
### POST localhost:8080/product/search
Send JSON body in the format {input:"search string"}. Returns a list of all products as JSON, including product id, name, description, normal_price, price, category, and image_url
### GET localhost:8080/product/sales
Returns a list of all products with price<normal_price as JSON, including product id, name, description, normal_price, price, category, and image_url
### GET localhost:8080/cart/all
Retuns a list all cart records for all users as JSON including id, product_id, cart_id
### POST localhost:8080/cart/add/{user_id}/{product_id}
Creates a cart record to add {product_id} to {user_id}'s cart. Returns the record to confirm success. May only be called by an authenticated user
### GET localhost:8080/cart/find/{user_id}
Returns a list of all products in {user_id}'s cart
### POST localhost:8080/user/login
Send JSON body in the format {email:"user@email.com",password:"userpassword"} to login a user using JWT
### POST localhost:8080/user/register
Send JSON body in the format {firstName:"John",lastName:"Doe",email:"user@email.com",password:"userpassword"} to register a new user
### GET localhost:8080/user/logout
Logout user
