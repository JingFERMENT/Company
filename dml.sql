-- Exercice 1
-- Insérez les trois enregistrements « engineering », « human_ressources », « research »
-- dans la table « departments ».
-- Insérez cinq enregistrements dans la table « employees ».
-- Le salaire sera le montant annuel.

-- ajouter des lignes 'INSERT INTO'
INSERT INTO `departments` (`name`) 
VALUES
('engineering'),
('human_ressources'),
('research');

-- respecter l'ordre des lignes 
INSERT INTO
    `employees`(
        `lastname`,
        `firstname`,
        `email`,
        `salary`,
        `id_department,`
        `birthdate`
    )
VALUES (
        'Zhang',
        'Jing',
        'zhang.jing.cn@hotmail.com',
        40000,
        1,
        '1984-08-23'
    ),
 (
        'Nicolas',
        'Dujardin',
        'nicolas.dujardin@gmail.com',
        20000,
        2,
        STR_TO_DATE('10-23-1994', '%m-%d-%Y')
    ),
 (
        'Jean',
        'Dupont',
        'jean.dupont@yahoo.fr',
        80000,
        3,
        STR_TO_DATE('10-23-2000', '%m-%d-%Y')
    );

INSERT INTO
    `departments`(`id_department`, `name`)
VALUES
(4, 'marketing'),
(5, 'informatique');

INSERT INTO
    employees(
        lastname,
        firstname,
        email,
        salary,
        id_department,
        birthdate
    )
VALUES (
        'Coralie',
        'Marie',
        'coralie.marie@gmail.com',
        '60000',
        '4',
        STR_TO_DATE('10-23-1998', '%m-%d-%Y')
    ),
 (
        'Mark',
        'Zuckerberg',
        'mark.zuckerberge@gmail.com',
        '8888',
        '5',
        STR_TO_DATE('10-23-1998', '%m-%d-%Y')
    );

-- Exercice 2
-- Mettez à jour le salaire de tous les employés du département 1 pour leur donner une
-- augmentation de 10%.

UPDATE `employees`
SET `salary` = `salary` * 1.1
WHERE
   `id_department` = 1 ;
    
-- Exercice 3
-- Sélectionnez le nom complet (concaténation de lastname et firstname) et le salaire des employés gagnant plus de 50000*.

SELECT
    CONCAT (`firstname`, ' ', `lastname`) AS 'full_name',
    `salary`,
    LENGTH(`lastname`) AS 'lastname_length',
    YEAR(`birthdate`)
FROM `employees`
-- WHERE `salary` > 50000 AND (`id_department` = 3 OR `id_department` = 4);
WHERE `salary` > 50000 AND (`id_department` IN (3,4));

-- -- Exercice 4
-- Supprimez tous les employés du département recherche dont le salaire est inférieur à 30000 *.
INSERT INTO
    `employees`(
        `lastname`,
        `firstname`,
        `email`,
        `salary`,
        `id_department`,
        `birthdate`
    )
VALUES (
        'Loui',
        'Pasteu',
        'louis.pasteur@gmail.com',
        '2999',
        '3',
        STR_TO_DATE('5-25-1822', '%m-%d-%Y')
    ),
    (
        'Lou',
        'Pas',
        'louis.pasteur@gmail.com',
        '299999999',
        '3',
        STR_TO_DATE('5-25-1822', '%m-%d-%Y')
    );

-- SELECT * from employees join departments ON (employees.id_department = departments.id_department)

DELETE FROM `employees`
WHERE
    `salary` < 30000
    AND `id_department` = 3;

-- Exercice 5
-- Ajoutez trois clients à la table « clients »
-- Ajoutez deux nouveaux projets* à la table « projects ».
-- *Les projets sont les travaux en cours de réalisation dans l’entreprise. 

INSERT INTO `clients`(`lastname`, `email`, `phone`)
VALUES ('Armand', 'rebecca.armand@gmail.com', '0622151632'),
('Hebert', 'aimee.hebert@yahoo.com', '0622151632'),
('Savry', 'emmanuel.savry@hotmail.com', '0632101637');

INSERT INTO `projects`(`name`, `description`, `start_date`, `id_client`,`budget`)
VALUES ('Amiens', 'rénover tous les parcs à Amiens', NOW(), 4, 1000000),
('Camon', 'améliorer les pistes cyclables', '2022-01-01', 5, 600000),
('Longueau', 'construire une école primaire', '2023-01-01', NULL,'1000')

UPDATE `projects` SET `id_client` = 1 
WHERE id_projetc = 1

-- Exercice 6
-- Associez les deux projets nouvellement créés à un client spécifique dans la table « projects ».

-- Exercice 7
-- Sélectionnez les noms complets (Lastname et Firstname) des employés et les noms des
-- départements auxquels ils appartiennent.
SELECT
    `employees`.`firstname`,
    `employees`.`lastname`,
    `departments`.`name`
FROM `employees` 
INNER JOIN `departments` ON `departments`.`id_department` = `employees`.`id_department`

-- Exercice 8
-- Affichez tous les projets ainsi que les noms des clients associés. Incluez également les projets
-- qui n'ont pas encore de client associé.

SELECT `projects`.`name`,  `clients`.`lastname`
FROM `projects` LEFT JOIN `clients` ON (`clients`.id_client = `projects`.id_client);

-- Exercice 9
-- Créer une table projects_employees permettant de relier les 2 tables via 2 clés étrangères.
-- Type de cardinalités N à N
CREATE TABLE projects_employees 
    (
        -- 'créer une clé primaire' est limitée. 
    `id_project` INT NOT NULL,
    `id_employee` INT NOT NULL,
    Foreign Key (`id_project`) REFERENCES projects(`id_project`),
    Foreign Key (`id_employee`) REFERENCES employees(`id_employee`)
);

INSERT INTO `projects_employees`(`id_project`, `id_employee`)
VALUES 
(7,5),
(7,7),
(7,9),
(7,14),
(8,5),
(8,7),
(9,5);

SELECT 
`projects`.`name`, 
`employees`.`id_employee`, 
`employees`.`lastname`, 
`employees`.`firstname`, 
`employees`.`id_department`,
`projects`.`id_client`,
`projects`.`start_date` 
`departments`.`name`
FROM `projects` 
INNER JOIN `projects_employees` ON (`projects_employees`.`id_project` = `projects`.`id_project`)
INNER JOIN `employees` ON (`employees`.`id_employee` = `projects_employees`.`id_employee`)
INNER JOIN `departments` ON (`departments`.`id_department` = `employees`.`id_department`)






















