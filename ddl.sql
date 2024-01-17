-- Exercice 1
-- Créer une base de donnée compagny avec le jeu de caractères utf8mb4.
CREATE DATABASE `company` CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_general_ci';
-- language SQL en majuscule 
-- COLLATE: pour les tris alphabétique


-- Exercice 2
-- Ajouter la table `employees` avec les colonnes suivantes :
-- • id_employee,
-- • lastname,
-- • firstname,
-- • email,
-- • salary,
-- • id_department

CREATE TABLE IF NOT EXISTS `employees`
(
    `id_employee` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `lastname` VARCHAR(100) NOT NULL,
    `firstname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `salary` INT,
    `id_department` INT NOT NULL
);

-- Exercice 3
-- Ajoutez les tables suivantes ainsi que leur colonnes respectives:
-- • departments (id_department, name)
-- • projects (id_project, name, description, start_date, end_date, id_client)
-- • clients (id_client, lastname, email, phone, id_project).
-- • supplier (id_supplier, name, email, products)
-- Veillez à typer chacune des colonnes.

CREATE TABLE `departments`
(
    -- contrainte: primary key
    `id_department` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL
);

CREATE TABLE `suppliers` 
(
    `id_supplier` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `products` VARCHAR(255) NOT NULL
);

CREATE TABLE `projects`
(
    `id_project` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `description` TEXT NOT NULL,
    `start_date` DATETIME NOT NULL, --format date : XXXX-XX-XX (année mois jour)
    `end_date` DATETIME,
    `id_client` INT NOT NULL
);

CREATE TABLE `clients`
(
    `id_client` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    `lastname` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(10) NOT NULL,
);

-- Exercice 5
-- Ajoutez une colonne « birthdate » à la table « employees ».
-- Modifiez la table « projects » pour inclure une colonne « budget ».
ALTER TABLE `employees`
ADD `birthdate` DATE;

ALTER TABLE `projects`
ADD `budget` INT;

-- Exercice 6
-- Modifiez la table « employees » pour inclure une relation entre les employés et les départements en mettant en place une « foreign key » permettant de la relier à la table « departments ».
-- Modifiez la table « projects » pour inclure une relation entre les projets et les clients en mettant en place une « foreign key » permettant de la relier à la table « clients ».
ALTER TABLE `employees`
ADD CONSTRAINT `FK_employeesDepartments`
FOREIGN KEY (`id_department`) REFERENCES departments(`id_department`);

ALTER TABLE `projects`
ADD CONSTRAINT `fk_clients_id`
FOREIGN KEY (`id_client`) REFERENCES `clients`(`id_client`);

-- Exercice 7
-- Supprimer la table « suppliers »
DROP TABLE `suppliers`;

ALTER TABLE `clients`
DROP FOREIGN KEY (`id_project`);
DROP COLUMN `id_project`;

ALTER TABLE `employees`
DROP COLUMN `id_department`;