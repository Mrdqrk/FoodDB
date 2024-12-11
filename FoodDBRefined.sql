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
    ('Pancakes', 20, 4.5, 'Global', 'Easy'),
    ('French Toast', 15, 4.2, 'Global', 'Easy'),
    ('Omelette', 10, 4.6, 'France', 'Easy'),
    ('Breakfast Burrito', 15, 4.4, 'Mexico', 'Medium'),
    ('Smoothie Bowl', 5, 4.8, 'Global', 'Easy'),
    ('Avocado Toast', 5, 4.7, 'Global', 'Easy'),
    ('Bagel with Cream Cheese', 5, 4.3, 'USA', 'Easy'),
    ('Breakfast Sandwich', 10, 4.5, 'USA', 'Medium'),
    ('Yogurt Parfait', 5, 4.7, 'Global', 'Easy'),
    ('Scrambled Eggs', 5, 4.6, 'Global', 'Easy'),
    ('Waffles', 15, 4.5, 'Belgium', 'Medium'),
    ('Chia Pudding', 10, 4.4, 'Global', 'Easy'),
    ('Muffins', 25, 4.3, 'USA', 'Medium'),
    ('Banana Bread', 60, 4.6, 'USA', 'Medium'),
    ('Eggs Benedict', 20, 4.7, 'USA', 'Medium'),
    ('Breakfast Quesadilla', 10, 4.4, 'Mexico', 'Medium'),
    ('Breakfast Casserole', 45, 4.5, 'USA', 'Medium'),
    ('Overnight Oats', 5, 4.8, 'Global', 'Easy'),
    ('Cinnamon Rolls', 120, 4.6, 'USA', 'Hard'),
    ('Frittata', 20, 4.7, 'Italy', 'Medium'),
    ('Granola', 30, 4.5, 'Global', 'Medium'),
    ('Breakfast Pizza', 20, 4.3, 'Italy', 'Medium'),
    ('Tofu Scramble', 10, 4.2, 'Global', 'Easy'),
    ('Quinoa Breakfast Bowl', 15, 4.4, 'Global', 'Medium'),
    ('Breakfast Tacos', 10, 4.6, 'Mexico', 'Easy'),
    ('Dutch Baby Pancake', 20, 4.5, 'Germany', 'Medium'),
    ('Fruit Salad', 5, 4.9, 'Global', 'Easy'),
    ('Poached Eggs', 10, 4.6, 'Global', 'Medium'),
    ('Acai Bowl', 5, 4.7, 'Brazil', 'Easy'),
    ('Hash Browns', 15, 4.5, 'USA', 'Medium'),
    ('Scones', 30, 4.3, 'UK', 'Medium'),
    ('Apple Cinnamon Oatmeal', 10, 4.6, 'Global', 'Easy'),
    ('Shakshuka', 25, 4.7, 'Middle East', 'Medium'),
    ('Breakfast Ramen', 15, 4.4, 'Japan', 'Medium'),
    ('Savory Oatmeal', 10, 4.5, 'Global', 'Medium'),
    ('Breakfast Queso Fundido', 20, 4.3, 'Mexico', 'Hard'),
    ('Japanese Tamago Sando', 10, 4.8, 'Japan', 'Easy'),
    ('Croque Madame', 15, 4.6, 'France', 'Medium'),
    ('Congee', 40, 4.5, 'China', 'Medium'),
    ('Turkish Menemen', 15, 4.5, 'Turkey', 'Easy'),
    ('Chia Seed Pudding with Mango', 10, 4.7, 'Global', 'Easy'),
    ('Beetroot and Sweet Potato Hash', 25, 4.6, 'Global', 'Medium'),
    ('Savory French Toast with Spinach and Feta', 15, 4.4, 'Global', 'Medium'),
    ('Breakfast Flatbread with Smoked Salmon', 10, 4.8, 'Global', 'Easy'),
    ('Coconut Rice Porridge', 30, 4.5, 'Thailand', 'Medium'),
    ('Breakfast Polenta with Mushroom and Spinach', 20, 4.6, 'Italy', 'Medium'),
    ('Banana Sushi', 5, 4.3, 'Global', 'Easy'),
    ('Baked Avocado with Eggs', 15, 4.7, 'Global', 'Medium'),
    ('Mexican Breakfast Torta', 10, 4.4, 'Mexico', 'Medium'),
    ('Breakfast Couscous with Apricots and Almonds', 10, 4.6, 'Global', 'Medium'),
    ('Savory Crepes with Mushrooms and Gruyere', 20, 4.7, 'France', 'Medium'),
    ('Mango Sticky Rice with Coconut Milk', 30, 4.5, 'Thailand', 'Medium'),
    ('Irish Boxty (Potato Pancakes)', 15, 4.4, 'Ireland', 'Medium'),
    ('Sweet Potato and Black Bean Breakfast Burrito', 20, 4.6, 'Mexico', 'Medium'),
    ('Breakfast Farro Bowl with Roasted Veggies', 30, 4.7, 'Global', 'Medium'),
    ('Green Smoothie with Spinach and Pineapple', 5, 4.8, 'Global', 'Easy'),
    ('Cottage Cheese Pancakes', 10, 4.4, 'Global', 'Easy'),
    ('Savory Breakfast Bowl with Kimchi', 15, 4.7, 'Korea', 'Medium'),
    ('Swedish Cardamom Buns', 120, 4.5, 'Sweden', 'Hard'),
    ('Pumpkin Spice Overnight Oats', 5, 4.7, 'Global', 'Easy'),
    ('Japanese Rice Porridge (Okayu)', 40, 4.5, 'Japan', 'Medium'),
    ('Breakfast Panzanella', 15, 4.6, 'Italy', 'Medium'),
    ('Breakfast Dumplings with Egg and Spinach', 20, 4.5, 'China', 'Medium'),
    ('Sweet Corn Pancakes', 15, 4.3, 'USA', 'Medium'),
    ('Tofu Breakfast Burrito', 10, 4.4, 'Mexico', 'Medium'),
    ('Herbed Ricotta Toast', 5, 4.7, 'Global', 'Easy'),
    ('Egg and Veggie Breakfast Tart', 25, 4.6, 'Global', 'Medium');


-- Sample inserts for NutritionalValue
INSERT INTO `NutritionalValue` (FoodID, Calories, Carbs, Fats, Proteins, ServingSize)
VALUES
    (1, 350, 50, 10, 8, '1 Serving'),
    (2, 300, 35, 12, 6, '1 Serving'),
    (3, 250, 5, 20, 15, '1 Omelette'),
    (4, 500, 40, 18, 25, '1 Burrito'),
    (5, 300, 40, 5, 8, '1 Bowl'),
    (6, 250, 30, 15, 5, '1 Toast'),
    (7, 400, 50, 18, 12, '1 Bagel'),
    (8, 450, 35, 20, 25, '1 Sandwich'),
    (9, 150, 1, 13, 10, '1 Serving'),
    (10, 300, 45, 7, 10, '1 Bowl'),
    (11, 300, 50, 8, 10, '1 Bagel'),
    (12, 400, 40, 15, 12, '1 Serving'),
    (13, 500, 50, 12, 15, '1 Burrito'),
    (14, 350, 30, 12, 15, '1 Serving'),
    (15, 350, 30, 25, 12, '1 Sandwich'),
    (16, 450, 45, 18, 20, '1 Serving'),
    (17, 500, 65, 12, 15, '1 Serving'),
    (18, 600, 50, 22, 18, '1 Serving'),
    (19, 350, 25, 12, 15, '1 Serving'),
    (20, 200, 20, 12, 6, '1 Serving'),
    (21, 350, 40, 12, 12, '1 Serving'),
    (22, 300, 50, 10, 8, '1 Serving'),
    (23, 400, 35, 15, 12, '1 Serving'),
    (24, 250, 35, 10, 8, '1 Serving'),
    (25, 300, 50, 12, 15, '1 Serving'),
    (26, 350, 40, 12, 15, '1 Serving'),
    (27, 500, 55, 18, 20, '1 Serving'),
    (28, 450, 50, 20, 10, '1 Serving'),
    (29, 300, 45, 5, 10, '1 Bowl'),
    (30, 350, 35, 20, 15, '1 Serving'),
    (31, 500, 60, 20, 20, '1 Serving'),
    (32, 400, 55, 15, 10, '1 Serving'),
    (33, 450, 40, 15, 18, '1 Serving'),
    (34, 350, 55, 12, 8, '1 Serving'),
    (35, 450, 50, 18, 18, '1 Serving'),
    (36, 250, 30, 8, 10, '1 Serving'),
    (37, 450, 50, 15, 15, '1 Serving'),
    (38, 500, 45, 25, 18, '1 Serving'),
    (39, 400, 50, 10, 10, '1 Serving'),
    (40, 350, 40, 10, 10, '1 Serving'),
    (41, 500, 45, 22, 25, '1 Serving'),
    (42, 400, 45, 12, 15, '1 Serving'),
    (43, 450, 45, 20, 15, '1 Serving'),
    (44, 400, 40, 12, 10, '1 Serving'),
    (45, 500, 45, 12, 25, '1 Serving'),
    (46, 350, 55, 15, 12, '1 Serving'),
    (47, 400, 40, 12, 15, '1 Serving');


-- Sample inserts for Recipe
INSERT INTO `Recipe` (FoodName, Ingredients, PreparationTime, Instructions)
VALUES
    ('Pancakes', 
        'Flour, Eggs, Milk, Baking Powder, Sugar, Butter', 
        20, 
        '1. Mix ingredients. 2. Pour batter onto hot griddle. 3. Flip and cook until golden brown.'),
    ('French Toast', 
        'Bread, Eggs, Milk, Cinnamon, Sugar, Butter', 
        15, 
        '1. Dip bread in egg mixture. 2. Cook in a skillet with butter.'),
    ('Omelette', 
        'Eggs, Milk, Cheese, Bell Peppers, Onions, Salt, Pepper', 
        10, 
        '1. Beat eggs with milk and seasonings. 2. Pour into pan, add fillings, and cook until set.'),
    ('Breakfast Burrito', 
        'Tortilla, Eggs, Cheese, Sausage, Bell Peppers, Salsa', 
        15, 
        '1. Scramble eggs with sausage and peppers. 2. Wrap in tortilla with cheese and salsa.'),
    ('Smoothie Bowl', 
        'Frozen Berries, Banana, Greek Yogurt, Granola, Honey', 
        5, 
        '1. Blend berries, banana, and yogurt. 2. Top with granola and honey.'),
    ('Avocado Toast', 
        'Bread, Avocado, Salt, Pepper, Lemon Juice', 
        5, 
        '1. Toast bread. 2. Mash avocado with seasonings and spread on toast.'),
    ('Bagel with Cream Cheese', 
        'Bagel, Cream Cheese', 
        5, 
        '1. Toast bagel. 2. Spread with cream cheese.'),
    ('Breakfast Sandwich', 
        'English Muffin, Egg, Cheese, Ham or Bacon', 
        10, 
        '1. Cook egg and meat. 2. Assemble on toasted muffin with cheese.'),
    ('Yogurt Parfait', 
        'Greek Yogurt, Berries, Granola, Honey', 
        5, 
        '1. Layer yogurt, berries, and granola in a bowl. 2. Drizzle with honey.'),
    ('Scrambled Eggs', 
        'Eggs, Butter, Salt, Pepper', 
        5, 
        '1. Whisk eggs with salt and pepper. 2. Cook in buttered skillet, stirring until set.'),
    ('Waffles', 
        'Flour, Eggs, Milk, Baking Powder, Sugar, Butter', 
        15, 
        '1. Mix ingredients. 2. Pour batter into waffle iron and cook until golden.'),
    ('Chia Pudding', 
        'Chia Seeds, Almond Milk, Honey, Berries', 
        10, 
        '1. Mix chia seeds with almond milk and honey. 2. Refrigerate until thick, then top with berries.'),
    ('Muffins', 
        'Flour, Sugar, Baking Powder, Eggs, Milk, Blueberries (optional)', 
        25, 
        '1. Mix dry and wet ingredients. 2. Fold in blueberries and bake in muffin tin.'),
    ('Banana Bread', 
        'Bananas, Flour, Sugar, Eggs, Baking Soda, Butter', 
        60, 
        '1. Mash bananas and mix with other ingredients. 2. Pour into loaf pan and bake.'),
    ('Eggs Benedict', 
        'English Muffin, Eggs, Canadian Bacon, Hollandaise Sauce', 
        20, 
        '1. Poach eggs. 2. Toast muffin, add bacon, top with egg and hollandaise sauce.'),
    ('Breakfast Quesadilla', 
        'Tortilla, Eggs, Cheese, Bacon or Sausage', 
        10, 
        '1. Scramble eggs with meat. 2. Add to tortilla with cheese and cook until crispy.'),
    ('Breakfast Casserole', 
        'Eggs, Hash Browns, Sausage, Cheese, Milk', 
        45, 
        '1. Mix ingredients. 2. Pour into baking dish and bake until set.'),
    ('Overnight Oats', 
        'Oats, Milk, Greek Yogurt, Chia Seeds, Honey', 
        5, 
        '1. Mix ingredients and refrigerate overnight. 2. Top with fruit before serving.'),
    ('Cinnamon Rolls', 
        'Flour, Yeast, Sugar, Butter, Cinnamon', 
        120, 
        '1. Prepare dough and let rise. 2. Roll with cinnamon sugar, slice, and bake.'),
    ('Frittata', 
        'Eggs, Milk, Vegetables, Cheese', 
        20, 
        '1. Beat eggs with milk and add vegetables. 2. Pour into skillet and bake until set.'),
    ('Granola', 
        'Oats, Honey, Almonds, Dried Fruit', 
        30, 
        '1. Mix ingredients and spread on baking sheet. 2. Bake until golden, stirring occasionally.'),
    ('Breakfast Pizza', 
        'Pizza Dough, Eggs, Bacon, Cheese', 
        20, 
        '1. Spread dough with cheese and bacon. 2. Crack eggs on top and bake.'),
    ('Tofu Scramble', 
        'Tofu, Turmeric, Bell Peppers, Spinach, Salt, Pepper', 
        10, 
        '1. Crumble tofu and sauté with vegetables and spices until warm.'),
    ('Quinoa Breakfast Bowl', 
        'Quinoa, Eggs, Avocado, Spinach, Hot Sauce', 
        15, 
        '1. Cook quinoa and eggs. 2. Assemble with avocado, spinach, and hot sauce.'),
    ('Breakfast Tacos', 
        'Tortillas, Eggs, Cheese, Salsa, Avocado', 
        10, 
        '1. Scramble eggs. 2. Fill tortillas with eggs, cheese, salsa, and avocado.'),
    ('Dutch Baby Pancake', 
        'Flour, Eggs, Milk, Sugar, Butter', 
        20, 
        '1. Blend ingredients. 2. Pour into hot skillet with butter and bake until puffed.'),
    ('Fruit Salad', 
        'Mixed Fruits, Honey, Lime Juice, Mint', 
        5, 
        '1. Chop fruits. 2. Toss with honey and lime juice, garnish with mint.'),
    ('Poached Eggs', 
        'Eggs, Vinegar, Water', 
        10, 
        '1. Bring water with vinegar to a simmer. 2. Gently poach eggs until whites are set.'),
    ('Acai Bowl', 
        'Acai Puree, Banana, Berries, Granola, Honey', 
        5, 
        '1. Blend acai and banana. 2. Top with berries, granola, and honey.'),
    ('Hash Browns', 
        'Potatoes, Salt, Pepper, Oil', 
        15, 
        '1. Grate potatoes and season. 2. Cook in skillet until crispy on both sides.'),
    ('Scones', 
        'Flour, Sugar, Butter, Baking Powder, Milk', 
        30, 
        '1. Mix ingredients until dough forms. 2. Shape and bake until golden.'),
    ('Apple Cinnamon Oatmeal', 
        'Oats, Apple, Cinnamon, Brown Sugar, Milk', 
        10, 
        '1. Cook oats with milk and apple. 2. Stir in cinnamon and sugar.'),
    ('Shakshuka', 
        'Tomatoes, Bell Peppers, Onion, Garlic, Eggs, Cumin, Paprika', 
        25, 
        '1. Sauté onions, peppers, and garlic with spices. 2. Add tomatoes and simmer. 3. Crack eggs on top and cook until set.'),
    ('Breakfast Ramen', 
        'Ramen Noodles, Soft-Boiled Eggs, Scallions, Bacon, Soy Sauce, Sesame Oil', 
        15, 
        '1. Cook noodles. 2. Top with soft-boiled egg, bacon, scallions, and drizzle with soy sauce and sesame oil.'),
    ('Savory Oatmeal', 
        'Oats, Chicken Broth, Spinach, Parmesan, Poached Egg, Salt, Pepper', 
        10, 
        '1. Cook oats in broth. 2. Stir in spinach and parmesan, and top with a poached egg.'),
    ('Breakfast Queso Fundido', 
        'Chorizo, Cheese, Tortilla Chips, Eggs, Salsa, Cilantro', 
        20, 
        '1. Cook chorizo and scramble eggs. 2. Melt cheese in a skillet, then add eggs and chorizo. Serve with chips and salsa.'),
    ('Japanese Tamago Sando', 
        'White Bread, Eggs, Mayo, Dijon Mustard', 
        10, 
        '1. Boil and mash eggs with mayo and mustard. 2. Spread on white bread and trim crusts for a classic look.'),
    ('Croque Madame', 
        'Bread, Ham, Gruyère Cheese, Butter, Egg, Bechamel Sauce', 
        15, 
        '1. Make sandwich with ham and cheese, and grill. 2. Top with bechamel and a fried egg.'),
    ('Congee', 
        'Rice, Chicken Broth, Ginger, Scallions, Soy Sauce, Sesame Oil', 
        40, 
        '1. Simmer rice with broth and ginger until porridge-like. 2. Garnish with scallions, soy sauce, and sesame oil.'),
    ('Turkish Menemen', 
        'Tomatoes, Green Peppers, Onion, Eggs, Olive Oil, Paprika', 
        15, 
        '1. Sauté onions and peppers. 2. Add tomatoes, then stir in eggs and cook until soft-set.'),
    ('Chia Seed Pudding with Mango', 
        'Chia Seeds, Coconut Milk, Honey, Mango', 
        10, 
        '1. Mix chia seeds, coconut milk, and honey, then refrigerate overnight. 2. Top with mango.'),
    ('Beetroot and Sweet Potato Hash', 
        'Beets, Sweet Potatoes, Onion, Olive Oil, Eggs', 
        25, 
        '1. Dice and roast beets and sweet potatoes. 2. Add a fried egg on top.'),
    ('Savory French Toast with Spinach and Feta', 
        'Bread, Eggs, Milk, Spinach, Feta Cheese, Garlic', 
        15, 
        '1. Dip bread in egg and milk mixture. 2. Fry with spinach and feta on top.'),
    ('Breakfast Flatbread with Smoked Salmon', 
        'Flatbread, Cream Cheese, Smoked Salmon, Capers, Red Onion, Dill', 
        10, 
        '1. Spread cream cheese on flatbread. 2. Add salmon, capers, onions, and dill.'),
    ('Coconut Rice Porridge', 
        'Jasmine Rice, Coconut Milk, Brown Sugar, Mango', 
        30, 
        '1. Simmer rice in coconut milk until tender. 2. Serve with brown sugar and mango.'),
    ('Breakfast Polenta with Mushroom and Spinach', 
        'Polenta, Mushrooms, Spinach, Parmesan, Olive Oil', 
        20, 
        '1. Cook polenta and set aside. 2. Sauté mushrooms and spinach, then top polenta.'),
    ('Banana Sushi', 
        'Bananas, Peanut Butter, Chia Seeds, Cocoa Nibs', 
        5, 
        '1. Spread peanut butter on banana, roll in seeds and nibs, then slice.'),
    ('Baked Avocado with Eggs', 
        'Avocado, Eggs, Salt, Pepper, Chives', 
        15, 
        '1. Halve avocado and scoop out a bit of flesh. 2. Crack egg into each half and bake until set.'),
    ('Mexican Breakfast Torta', 
        'Bolillo Roll, Refried Beans, Avocado, Scrambled Eggs, Salsa', 
        10, 
        '1. Spread beans on roll. 2. Layer with avocado, scrambled eggs, and salsa.'),
    ('Breakfast Couscous with Apricots and Almonds', 
        'Couscous, Dried Apricots, Almonds, Honey, Greek Yogurt', 
        10, 
        '1. Prepare couscous and stir in chopped apricots and almonds. Serve with honey and yogurt.'),
    ('Savory Crepes with Mushrooms and Gruyere', 
        'Crepe Batter, Mushrooms, Gruyere Cheese, Thyme', 
        20, 
        '1. Cook mushrooms and set aside. 2. Make crepes, fill with mushrooms and cheese, then fold.'),
    ('Mango Sticky Rice with Coconut Milk', 
        'Sticky Rice, Coconut Milk, Sugar, Mango', 
        30, 
        '1. Cook sticky rice. 2. Mix with sweetened coconut milk and top with mango.'),
    ('Irish Boxty (Potato Pancakes)', 
        'Potatoes, Flour, Eggs, Salt, Butter', 
        15, 
        '1. Grate potatoes and mix with flour and eggs. 2. Fry in butter until golden.'),
    ('Sweet Potato and Black Bean Breakfast Burrito', 
        'Tortilla, Sweet Potato, Black Beans, Eggs, Avocado, Salsa', 
        20, 
        '1. Roast sweet potatoes. 2. Scramble eggs, then fill tortilla with all ingredients.'),
    ('Breakfast Farro Bowl with Roasted Veggies', 
        'Farro, Cherry Tomatoes, Zucchini, Eggs, Olive Oil, Basil', 
        30, 
        '1. Roast veggies. 2. Serve over farro and top with a poached egg and basil.'),
    ('Green Smoothie with Spinach and Pineapple', 
        'Spinach, Pineapple, Banana, Coconut Water, Chia Seeds', 
        5, 
        '1. Blend all ingredients until smooth.'),
    ('Cottage Cheese Pancakes', 
        'Cottage Cheese, Eggs, Oats, Vanilla', 
        10, 
        '1. Blend ingredients into batter. 2. Cook on griddle until golden.'),
    ('Savory Breakfast Bowl with Kimchi', 
        'Quinoa, Kimchi, Avocado, Poached Egg, Scallions, Sesame Seeds', 
        15, 
        '1. Prepare quinoa and add toppings.'),
    ('Swedish Cardamom Buns', 
        'Flour, Sugar, Cardamom, Yeast, Butter, Milk', 
        120, 
        '1. Make dough and let rise. 2. Roll with cardamom filling, slice, and bake.'),
    ('Pumpkin Spice Overnight Oats', 
        'Oats, Milk, Pumpkin Puree, Maple Syrup, Cinnamon', 
        5, 
        '1. Mix ingredients and refrigerate overnight.'),
    ('Japanese Rice Porridge (Okayu)', 
        'Rice, Water, Salt, Scallions, Soy Sauce', 
        40, 
        '1. Simmer rice with water until porridge consistency. 2. Garnish with scallions and soy sauce.'),
    ('Breakfast Panzanella', 
        'Bread, Cherry Tomatoes, Cucumbers, Basil, Olive Oil, Fried Egg', 
        15, 
        '1. Toss bread with tomatoes and cucumbers. 2. Top with fried egg.'),
    ('Breakfast Dumplings with Egg and Spinach', 
        'Dumpling Wrappers, Eggs, Spinach, Green Onion', 
        20, 
        '1. Scramble eggs and spinach. 2. Fill dumpling wrappers and steam.'),
    ('Sweet Corn Pancakes', 
        'Cornmeal, Flour, Eggs, Milk, Corn Kernels', 
        15, 
        '1. Mix ingredients and cook pancakes until golden.'),
    ('Tofu Breakfast Burrito', 
        'Tofu, Black Beans, Tortilla, Salsa, Spinach', 
        10, 
        '1. Sauté tofu and spinach. 2. Fill tortilla with all ingredients.'),
    ('Herbed Ricotta Toast', 
        'Bread, Ricotta, Fresh Herbs, Lemon Zest, Honey', 
        5, 
        '1. Spread ricotta on toast. 2. Top with herbs, lemon zest, and honey.'),
    ('Egg and Veggie Breakfast Tart', 
        'Puff Pastry, Eggs, Asparagus, Cherry Tomatoes, Feta', 
        25, 
        '1. Arrange vegetables on puff pastry. 2. Crack eggs and bake until set.');
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

    -- Populate Diet Table
INSERT INTO `Diet` (FoodID, Vegetarian, Pescatarian, Vegan, Allergies)
VALUES
    (1, FALSE, FALSE, FALSE, 'Gluten, Dairy'),  -- Pancakes: Contains eggs, milk, butter
    (2, FALSE, FALSE, FALSE, 'Gluten, Dairy'),  -- French Toast: Contains eggs, milk
    (3, FALSE, FALSE, FALSE, 'Dairy'),          -- Omelette: Contains eggs, cheese
    (4, FALSE, FALSE, FALSE, 'Dairy, Gluten'),  -- Breakfast Burrito: Sausage, eggs
    (5, TRUE, TRUE, TRUE, 'None'),             -- Smoothie Bowl: Vegan ingredients
    (6, TRUE, TRUE, TRUE, 'None'),             -- Avocado Toast: Vegan ingredients
    (7, TRUE, TRUE, TRUE, 'Gluten, Dairy'),    -- Bagel with Cream Cheese: Vegetarian
    (8, FALSE, TRUE, FALSE, 'Dairy'),          -- Breakfast Sandwich: Ham/Bacon, cheese
    (9, TRUE, TRUE, TRUE, 'Dairy'),            -- Yogurt Parfait: Contains dairy
    (10, TRUE, TRUE, TRUE, 'None'),             -- Scrambled Eggs: Vegetarian (eggs only)
    (11, FALSE, FALSE, FALSE, 'Gluten, Dairy'), -- Waffles: Contains eggs, milk, butter
    (12, TRUE, TRUE, TRUE, 'None'),             -- Chia Pudding: Vegan ingredients
    (13, TRUE, TRUE, TRUE, 'Gluten'),           -- Muffins: Contains gluten, vegetarian
    (14, FALSE, FALSE, FALSE, 'Gluten, Dairy'), -- Banana Bread: Contains butter, eggs
    (15, FALSE, FALSE, FALSE, 'Dairy'),         -- Eggs Benedict: Contains eggs, ham, dairy
    (16, FALSE, FALSE, FALSE, 'Dairy, Gluten'), -- Breakfast Quesadilla: Bacon/sausage, cheese
    (17, FALSE, FALSE, FALSE, 'Gluten, Dairy'), -- Breakfast Casserole: Sausage, milk, cheese
    (18, TRUE, TRUE, TRUE, 'None'),             -- Overnight Oats: Vegan ingredients
    (19, FALSE, FALSE, FALSE, 'Gluten, Dairy'), -- Cinnamon Rolls: Butter, eggs, milk
    (20, TRUE, TRUE, TRUE, 'Dairy'),            -- Frittata: Eggs, cheese, vegetarian
    (21, TRUE, TRUE, TRUE, 'None'),             -- Granola: Vegan ingredients
    (22, FALSE, FALSE, FALSE, 'Dairy, Gluten'), -- Breakfast Pizza: Bacon, eggs, cheese
    (23, TRUE, TRUE, TRUE, 'None'),             -- Tofu Scramble: Vegan ingredients
    (24, TRUE, TRUE, TRUE, 'None'),             -- Quinoa Breakfast Bowl: Vegetarian ingredients
    (25, FALSE, TRUE, FALSE, 'None'),           -- Breakfast Tacos: Eggs, cheese, vegetarian
    (26, TRUE, TRUE, TRUE, 'Gluten, Dairy'),    -- Dutch Baby Pancake: Eggs, butter, vegetarian
    (27, TRUE, TRUE, TRUE, 'None'),             -- Fruit Salad: Vegan ingredients
    (28, TRUE, TRUE, TRUE, 'None'),             -- Poached Eggs: Eggs, vegetarian
    (29, TRUE, TRUE, TRUE, 'None'),             -- Acai Bowl: Vegan ingredients
    (30, TRUE, TRUE, TRUE, 'None'),             -- Hash Browns: Vegan ingredients
    (31, TRUE, TRUE, TRUE, 'Gluten, Dairy'),    -- Scones: Butter, milk, vegetarian
    (32, TRUE, TRUE, TRUE, 'Dairy'),            -- Apple Cinnamon Oatmeal: Milk, vegetarian
    (33, FALSE, FALSE, FALSE, 'Eggs'),          -- Shakshuka: Eggs, vegetarian
    (34, FALSE, FALSE, FALSE, 'Eggs'),          -- Breakfast Ramen: Eggs, bacon
    (35, TRUE, TRUE, TRUE, 'Dairy'),            -- Savory Oatmeal: Parmesan, eggs
    (36, FALSE, FALSE, FALSE, 'Dairy'),         -- Breakfast Queso Fundido: Eggs, chorizo
    (37, TRUE, TRUE, TRUE, 'None'),             -- Japanese Tamago Sando: Eggs, vegetarian
    (38, FALSE, FALSE, FALSE, 'Dairy, Gluten'), -- Croque Madame: Ham, cheese, bechamel
    (39, TRUE, TRUE, TRUE, 'None'),             -- Congee: Vegan ingredients
    (40, TRUE, TRUE, TRUE, 'None'),             -- Turkish Menemen: Eggs, vegetarian
    (41, TRUE, TRUE, TRUE, 'Dairy'),            -- Chia Seed Pudding with Mango: Vegetarian
    (42, TRUE, TRUE, TRUE, 'None'),             -- Beetroot and Sweet Potato Hash: Vegetarian
    (43, TRUE, TRUE, TRUE, 'Dairy'),            -- Savory French Toast: Eggs, milk
    (44, FALSE, FALSE, FALSE, 'Gluten, Dairy'), -- Breakfast Flatbread: Salmon, cheese
    (45, TRUE, TRUE, TRUE, 'Dairy'),            -- Coconut Rice Porridge: Milk, vegetarian
    (46, TRUE, TRUE, TRUE, 'None'),             -- Breakfast Polenta: Vegan ingredients
    (47, TRUE, TRUE, TRUE, 'None'),             -- Banana Sushi: Vegan ingredients
    (48, TRUE, TRUE, TRUE, 'None'),             -- Baked Avocado with Eggs: Vegetarian
    (49, TRUE, TRUE, TRUE, 'None'),             -- Mexican Breakfast Torta: Vegetarian
    (50, TRUE, TRUE, TRUE, 'Dairy'),            -- Breakfast Couscous: Vegetarian ingredients
    (51, TRUE, TRUE, TRUE, 'Dairy'),            -- Savory Crepes: Vegetarian ingredients
    (52, TRUE, TRUE, TRUE, 'Dairy'),            -- Mango Sticky Rice: Vegetarian ingredients
    (53, TRUE, TRUE, TRUE, 'Dairy'),            -- Irish Boxty: Vegetarian ingredients
    (54, TRUE, TRUE, TRUE, 'None'),             -- Sweet Potato Breakfast Burrito: Vegetarian
    (55, TRUE, TRUE, TRUE, 'None'),             -- Breakfast Farro Bowl: Vegetarian
    (56, TRUE, TRUE, TRUE, 'None'),             -- Green Smoothie: Vegan ingredients
    (57, TRUE, TRUE, TRUE, 'Dairy'),            -- Cottage Cheese Pancakes: Dairy, vegetarian
    (58, TRUE, TRUE, TRUE, 'None'),             -- Savory Breakfast Bowl: Vegetarian ingredients
    (59, FALSE, FALSE, FALSE, 'Gluten, Dairy'), -- Swedish Cardamom Buns: Vegetarian ingredients
    (60, TRUE, TRUE, TRUE, 'Dairy'),            -- Pumpkin Spice Oats: Vegetarian ingredients
    (61, TRUE, TRUE, TRUE, 'None'),             -- Japanese Rice Porridge: Vegan ingredients
    (62, TRUE, TRUE, TRUE, 'None'),             -- Breakfast Panzanella: Vegan ingredients
    (63, TRUE, TRUE, TRUE, 'Dairy'),            -- Breakfast Dumplings: Eggs, vegetarian
    (64, TRUE, TRUE, TRUE, 'Dairy'),            -- Sweet Corn Pancakes: Milk, vegetarian
    (65, TRUE, TRUE, TRUE, 'None'),             -- Tofu Breakfast Burrito: Vegan ingredients
    (66, TRUE, TRUE, TRUE, 'None'),             -- Herbed Ricotta Toast: Vegetarian ingredients
    (67, TRUE, TRUE, TRUE, 'Dairy');            -- Egg and Veggie Tart: Vegetarian ingredients

CREATE VIEW PaginatedRecipes AS
SELECT 
    CEIL(ROW_NUMBER() OVER (ORDER BY id) / 3.0) AS PageNumber, -- Calculate page number (3 recipes per page)
    ROW_NUMBER() OVER (ORDER BY id) AS RowNum,                -- Row number for fine control
    id AS RecipeID, 
    FoodName, 
    Ingredients
    FROM Recipe;


