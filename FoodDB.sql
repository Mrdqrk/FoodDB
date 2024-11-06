-- Create a database
DROP DATABASE IF EXISTS `FoodDB`;
CREATE DATABASE IF NOT EXISTS `FoodDB`;
-- Use the created database
USE FoodDB;


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
    Pass TEXT NOT NULL);
    

DROP TABLE IF EXISTS `Favorites`;
CREATE TABLE `Favorites` (
id Int (10) NOT NULL,
user_id INT,
recipe_id INT (10) NOT NULL,
added_to DATETIME DEFAULT CURRENT_TIMESTAMP,
Primary Key (id),
Foreign Key (user_id) References `User`(UserID),
Foreign Key (recipe_id) References Recipe(id),
username VARCHAR(20) NOT NULL,
password VARCHAR(20) NOT NULL,
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


-- Insert some sample entries into FoodItems
-- INSERT INTO `FoodItems` (FoodName, IsVegetarian, CookTime, Region, Difficulty) VALUES
-- ('Margherita Pizza', TRUE, 30, 4.5, 'Italy', 'Easy'),
-- ('Chicken Masala', FALSE, 45, 4.7, 'India', 'Medium'),
-- ('Sushi Platter', TRUE, 60, 4.8, 'Japan', 'Hard'),
-- ('Cheeseburger', FALSE, 25, 4.2, 'USA', 'Easy'),
-- ('Caesar Salad', TRUE, 15, 4.0, 'USA', 'Easy');

-- INSERT INTO `NurtritionalValue` (Allergies, Calories, ServingSize) VALUES
-- ('Gluten, Dairy', 250, '1 Slice'),
-- ('Dairy, Nuts', 400, '1 Plate'),
-- ('Fish', 300, '10 Pieces'),
-- ('Gluten, Dairy', 500, '1 Sandwich'),
-- ('Dairy, Gluten', 150, '1 Bowl');

-- INSERT INTO `Recipe`(Ratings) VALUES
-- (4.5),
-- (4.7),
-- (4.8),
-- (4.2),
-- (4.0);

-- INSERT INTO `Favorites` () VALUES
-- (
-- );

-- INSERT INTO `User` () VALUES ();

