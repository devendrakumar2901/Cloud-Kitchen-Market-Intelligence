CREATE DATABASE swiggy_analysis;
USE swiggy_analysis;

CREATE TABLE restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    cuisine VARCHAR(255),
    rating DECIMAL(3,1),
    reviews VARCHAR(50),
    cost_for_two INT,
    delivery_time VARCHAR(50),
    locality VARCHAR(255)
);

CREATE TABLE menu_categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    category_name VARCHAR(255)
);

CREATE TABLE menu_items (
    item_id INT AUTO_INCREMENT PRIMARY KEY,
    restaurant_name VARCHAR(255),
    menu_category VARCHAR(255),
    item_name VARCHAR(255),
    price INT
);
# Top Rated Restaurants
SELECT restaurant_name, rating
FROM restaurants
ORDER BY rating DESC
LIMIT 10;

# Average Cost For Two
SELECT ROUND(AVG(cost_for_two),2) AS avg_cost
FROM restaurants;

# Most Expensive Restaurants
SELECT restaurant_name,cost_for_two
FROM restaurants
ORDER BY cost_for_two DESC
LIMIT 10;

# Cheapest Restaurants
SELECT restaurant_name,cost_for_two
FROM restaurants
ORDER BY cost_for_two ASC
LIMIT 10;

# Average Rating
SELECT ROUND(AVG(rating),2) AS avg_rating
FROM restaurants;

# Cuisine Distribution
SELECT cuisine,
COUNT(*) AS total_restaurants
FROM restaurants
GROUP BY cuisine
ORDER BY total_restaurants DESC;

# Highest Priced Menu Items
SELECT restaurant_name,
item_name,
price
FROM menu_items
ORDER BY price DESC
LIMIT 10;

# Average Menu Price by Restaurant
SELECT restaurant_name,
ROUND(AVG(price),2) AS avg_menu_price
FROM menu_items
GROUP BY restaurant_name
ORDER BY avg_menu_price DESC;

# Category Count by Restaurant
SELECT restaurant_name,
COUNT(*) AS total_categories
FROM menu_categories
GROUP BY restaurant_name
ORDER BY total_categories DESC;

# Restaurant Performance Score
SELECT
restaurant_name,
rating,
cost_for_two,
reviews
FROM restaurants
ORDER BY rating DESC;



