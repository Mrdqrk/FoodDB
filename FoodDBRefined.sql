-- Drop and create the FoodDB database
DROP DATABASE IF EXISTS `FoodDB`;
CREATE DATABASE IF NOT EXISTS `FoodDB`;
USE FoodDB;

-- Drop and create FoodItems table
DROP TABLE IF EXISTS `FoodItems`;
CREATE TABLE `FoodItems` (
    FoodID INT AUTO_INCREMENT PRIMARY KEY,
    FoodName VARCHAR(100) NOT NULL,
    CookTime INT,
    Ratings DECIMAL(3, 2),
    Region VARCHAR(50),
    Difficulty ENUM('Easy', 'Medium', 'Hard')
);

-- Drop and create NutritionalValue table
DROP TABLE IF EXISTS `NutritionalValue`;
CREATE TABLE `NutritionalValue` (
    FoodID INT PRIMARY KEY,
    Calories INT,
    Carbs INT,
    Fats INT,
    Proteins INT,
    ServingSize VARCHAR(50),
    FOREIGN KEY (FoodID) REFERENCES FoodItems(FoodID) ON DELETE CASCADE
);

-- Drop and create Recipe table
DROP TABLE IF EXISTS `Recipe`;
CREATE TABLE `Recipe` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    FoodName VARCHAR(60) NOT NULL,
    Ingredients TEXT NOT NULL,
    PreparationTime INT NOT NULL,
    Instructions TEXT NOT NULL
);

-- Drop and create User table
DROP TABLE IF EXISTS `User`;
CREATE TABLE IF NOT EXISTS `User` (
    UserID INT PRIMARY KEY AUTO_INCREMENT,
    Username VARCHAR(20) NOT NULL,
    Password VARCHAR(255) NOT NULL  -- Should now use hashed passwords
);

-- Drop and create Favorites table
DROP TABLE IF EXISTS `Favorites`;
CREATE TABLE `Favorites` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    UserID INT,
    RecipeID INT NOT NULL,
    AddedTo DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UserID) REFERENCES `User`(UserID) ON DELETE CASCADE,
    FOREIGN KEY (RecipeID) REFERENCES Recipe(id) ON DELETE CASCADE
);

-- Drop and create Diet table
DROP TABLE IF EXISTS `Diet`;
CREATE TABLE `Diet` (
    FoodID INT PRIMARY KEY,
    Vegetarian BOOLEAN NOT NULL,
    Pescatarian BOOLEAN NOT NULL,
    Vegan BOOLEAN NOT NULL,
    Allergies TEXT NOT NULL,
    FOREIGN KEY (FoodID) REFERENCES FoodItems(FoodID) ON DELETE CASCADE
);

-- Sample inserts for FoodItems
INSERT INTO `FoodItems` (FoodName, CookTime, Ratings, Region, Difficulty)
VALUES 
    ('Spaghetti Carbonara', 30, 4.5, 'Italy', 'Medium'),
    ('Vegetable Stir Fry', 15, 4.0, 'China', 'Easy'),
    ('Beef Wellington', 120, 5.0, 'England', 'Hard'),
    ('Grilled Salmon', 25, 4.7, 'Norway', 'Medium'),
    ('Chicken Tikka Masala', 40, 4.3, 'India', 'Medium');

-- Sample inserts for NutritionalValue
INSERT INTO `NutritionalValue` (FoodID, Calories, Carbs, Fats, Proteins, ServingSize)
VALUES
    (1, 600, 80, 20, 25, '1 Plate'),
    (2, 350, 50, 10, 15, '1 Plate'),
    (3, 700, 40, 40, 35, '1 Plate'),
    (4, 400, 30, 18, 28, '1 Filet'),
    (5, 500, 55, 15, 30, '1 Plate');

-- Sample inserts for Recipe
INSERT INTO `Recipe` (FoodName, Ingredients, PreparationTime, Instructions)
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

-- Sample inserts for User
INSERT INTO `User` (Username, Password)
VALUES
    ('john_doe', 'hashed_password_123'),
    ('jane_smith', 'hashed_password_456'),
    ('alice_wong', 'hashed_password_789');

-- Sample inserts for Favorites
INSERT INTO `Favorites` (UserID, RecipeID)
VALUES
    (1, 1),
    (1, 4),
    (2, 3),
    (2, 5),
    (3, 2);

-- Sample inserts for Diet
INSERT INTO `Diet` (FoodID, Vegetarian, Pescatarian, Vegan, Allergies)
VALUES
    (1, FALSE, FALSE, FALSE, 'None'),
    (2, TRUE, TRUE, TRUE, 'None'),
    (3, FALSE, FALSE, FALSE, 'Gluten'),
    (4, FALSE, TRUE, FALSE, 'None'),
    (5, FALSE, FALSE, FALSE, 'Dairy, Nuts');
