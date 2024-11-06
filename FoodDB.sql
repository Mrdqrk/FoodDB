-- Create a database
DROP DATABASE IF EXISTS `FoodDB`;
CREATE DATABASE IF NOT EXISTS `FoodDB`;
-- Use the created database
USE FoodDB;

-- Create a table for food items with additional attributes
DROP TABLE IF EXISTS `FoodItems`;
CREATE TABLE `FoodItems` (
    FoodID INT AUTO_INCREMENT PRIMARY KEY,     -- Primary Key
    FoodName VARCHAR(100) NOT NULL,            -- Food Name
    CookTime INT,                              -- Cook time in minutes
    Ratings DECIMAL(3, 2),                     -- Ratings out of 5
    Region VARCHAR(50),             		   -- Region the food is from
    Difficulty ENUM('Easy', 'Medium', 'Hard')  -- Difficulty level
);

DROP TABLE IF EXISTS `NutritionalValue`;
CREATE TABLE `NutritionalValue` (
    FoodID INT,                         -- Primary Key    
	Calories INT,               	-- Calories per serving
    Carbs INT,						-- Carbohydrates per serving
    Fats INT,						-- Total fat per servings
    Proteins INT,					-- Protein per serving
	ServingSize VARCHAR(50)       	-- Serving size (e.g., "1 Plate", "250g")
);

DROP TABLE IF EXISTS `Recipe`;
CREATE TABLE `Recipe` (
    id INT (10) NOT NULL AUTO_INCREMENT,
    Food_name VARCHAR(60) NOT NULL,
    Ingredients TEXT NOT NULL,
    Preparation_time INT NOT NULL,
    Instructions TEXT NOT NULL,
    PRIMARY KEY (id) 
);

DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User`(
	UserID INT PRIMARY KEY AUTO_INCREMENT,
    Pass TEXT NOT NULL,
    username VARCHAR(20) NOT NULL,
    password VARCHAR(20) NOT NULL);
    

DROP TABLE IF EXISTS `Favorites`;
CREATE TABLE `Favorites` (
id Int (10) NOT NULL,
user_id INT,
recipe_id INT (10) NOT NULL,
added_to DATETIME DEFAULT CURRENT_TIMESTAMP,
Primary Key (id),
Foreign Key (user_id) References `User`(UserID),
Foreign Key (recipe_id) References Recipe(id),
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
    
CREATE TABLE `Diet`(
    `FoodID` BIGINT NOT NULL,
    `Vegetarian` BOOLEAN NOT NULL,
    `Pescatarian` BOOLEAN NOT NULL,
    `Vegan` BOOLEAN NOT NULL,
    `Allergies` TEXT NOT NULL,		-- Comma-separated list of allergies
    PRIMARY KEY(`FoodID`)
);


-- sample inserts

INSERT INTO `FoodItems` (FoodName, CookTime, Ratings, Region, Difficulty)
VALUES 
    ('Spaghetti Carbonara', 30, 4.5, 'Italy', 'Medium'),
    ('Vegetable Stir Fry', 15, 4.0, 'China', 'Easy'),
    ('Beef Wellington', 120, 5.0, 'England', 'Hard'),
    ('Grilled Salmon', 25, 4.7, 'Norway', 'Medium'),
    ('Chicken Tikka Masala', 40, 4.3, 'India', 'Medium');


INSERT INTO `NutritionalValue` (FoodID, Calories, Carbs, Fats, Proteins, ServingSize)
VALUES
    (1, 600, 80, 20, 25, '1 Plate'),
    (2, 350, 50, 10, 15, '1 Plate'),
    (3, 700, 40, 40, 35, '1 Plate'),
    (4, 400, 30, 18, 28, '1 Filet'),
    (5, 500, 55, 15, 30, '1 Plate');

INSERT INTO `Recipe` (Food_name, Ingredients, Preparation_time, Instructions)
VALUES
    ('Spaghetti Carbonara', 
        'Spaghetti, Eggs, Parmesan Cheese, Pancetta, Garlic, Black Pepper', 
        30, 
        '1. Boil the spaghetti. 2. Cook pancetta in a pan. 3. Mix eggs and cheese, and combine with cooked pasta and pancetta.'),
    ('Vegetable Stir Fry', 
        'Broccoli, Bell Peppers, Carrots, Soy Sauce, Olive Oil, Ginger', 
        15, 
        '1. Chop vegetables. 2. Stir fry in a pan with soy sauce and olive oil until tender.'),
    ('Beef Wellington', 
        'Beef Tenderloin, Puff Pastry, Mushrooms, Prosciutto, Egg', 
        120, 
        '1. Sear beef. 2. Roll with mushroom and prosciutto. 3. Wrap in puff pastry and bake.'),
    ('Grilled Salmon', 
        'Salmon Filets, Olive Oil, Lemon, Garlic, Salt, Pepper', 
        25, 
        '1. Season salmon with olive oil, lemon, and spices. 2. Grill for 10-12 minutes.'),
    ('Chicken Tikka Masala', 
        'Chicken, Yogurt, Tomatoes, Onion, Garlic, Ginger, Garam Masala', 
        40, 
        '1. Marinate chicken in yogurt and spices. 2. Cook chicken, then make masala sauce with tomatoes, onions, and spices.');

INSERT INTO `User` (Pass, username, password)
VALUES
    ('hashed_password_123', 'john_doe', 'password123'),
    ('hashed_password_456', 'jane_smith', 'securepass456'),
    ('hashed_password_789', 'alice_wong', 'mypassword789');

INSERT INTO `Favorites` (user_id, recipe_id)
VALUES
    (1, 1),   -- John Doe's favorite is Spaghetti Carbonara
    (1, 4),   -- John Doe's favorite is Grilled Salmon
    (2, 3),   -- Jane Smith's favorite is Beef Wellington
    (2, 5),   -- Jane Smith's favorite is Chicken Tikka Masala
    (3, 2);   -- Alice Wong's favorite is Vegetable Stir Fry

INSERT INTO `Diet` (FoodID, Vegetarian, Pescatarian, Vegan, Allergies)
VALUES
    (1, FALSE, FALSE, FALSE, 'None'),           -- Spaghetti Carbonara: Not vegetarian, not vegan, no allergies
    (2, TRUE, TRUE, TRUE, 'None'),              -- Vegetable Stir Fry: Vegetarian, Pescatarian, Vegan, no allergies
    (3, FALSE, FALSE, FALSE, 'Gluten'),         -- Beef Wellington: Not vegetarian, not vegan, contains gluten
    (4, FALSE, TRUE, FALSE, 'None'),            -- Grilled Salmon: Not vegetarian, pescatarian, not vegan, no allergies
    (5, FALSE, FALSE, FALSE, 'Dairy, Nuts');    -- Chicken Tikka Masala: Not vegetarian, not vegan, contains dairy and nuts
