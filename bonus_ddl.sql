-- Créer une base de donnée compagny avec le jeu de caractères utf8mb4.
CREATE DATABASE `lamanu_shop`CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';

-- Ajouter la table `products` avec les colonnes suivantes :
CREATE TABLE `colors`
(
    `id_color` INT PRIMARY KEY AUTO_INCREMENT,
    `color` VARCHAR(50) DEFAULT 'Yellow'
);

CREATE TABLE `sizes`
(
    `id_size` INT PRIMARY KEY AUTO_INCREMENT,
    `size` VARCHAR(50) DEFAULT 'Small'  
);

CREATE TABLE `products`
(
    `id_product` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `description` TEXT,
    `priceHT` VARCHAR(255) NOT NULL,
    `weight` INT,
    `stock` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME,
    `archived_at` DATETIME,
    `id_color` INT,
    `id_size` INT,
    FOREIGN KEY (`id_color`) REFERENCES `colors`(`id_color`),
      ON DELETE SET NULL, 
    -- RESTRICT comportement par défaut BIGINT
    -- SET NULL supprimer et mettre null à la place
    -- CASCADE : chaque parent lié
    -- ON UPDATE CASCADE 
    FOREIGN KEY (`id_size`) REFERENCES `sizes`(`id_size`)
);

CREATE TABLE `orders`
(
    `id_order` INT PRIMARY KEY AUTO_INCREMENT,
    `num` INT,
    `created_at` DATETIME,
    `paid_at` DATETIME,
    `state` VARCHAR(50)
);

CREATE TABLE `products_orders`
(
    `id_product`INT ,
    `id_order`INT ,
    Foreign Key (id_product) REFERENCES products(id_product),
    Foreign Key (id_order) REFERENCES orders(id_order),
    `quantity` INT NOT NULL
);


CREATE TABLE `customers`
(
    `id_customer` INT PRIMARY KEY AUTO_INCREMENT,
    `lastname` VARCHAR(100) NOT NULL,
    `firstname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `registered_at` DATETIME NOT NULL,
    `validated_at` DATETIME NOT NULL
);



CREATE TABLE `cities`
(
    `id_city` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `zipcode` VARCHAR(10) NOT NULL
);


