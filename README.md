Voici les étapes pour la création des bases des données:
•	J’ai choisi MySQL comme le système de gestion des bases de données, et j’ai utilisé PhpMyAdmin comme interface de ligne de commande. 
•	J’ai créé la base des données en utilisant les DDL (data définition langage) : CREATE DATABSE `Company`
•	J’ai identifié les différentes entités de la base des données avec le logiciel Looping
•	J’ai créée des tables pour chacun de ces entités en spécifiant les colonnes appropriées.
  o	Une table pour « employees » avec les différentes colonnes (ex : id, lastname, firstname, etc…)
  o	Une table pour « projets » avec les colonnes comme ‘name’, ‘description’, ‘start_at’ etc …
  o	Une table pour « clients » avec les colonnes comme ‘name’, ‘phone’ etc…
  o	Une table pour « suppliers » avec les colonnes comme ‘name’, ‘email’ etc…
•	J’ai ajouté les clés étrangères pour établir les relations entre les tables 
  o	Ajouter une «foreign key » pour inclure une relation entre les employées et les départements
  o	Ajouter une «foreign key » pour inclure une relation entre les projets et les clients
•	J’ai utilisé les DML (data manipulation langage) pour effectuer les opérations CRUD sur les tables
  o	Create : insérer les données dans les tables
  o	Read : lister des données, 
  o	Update : modifier les données,
  o	Delete : supprimer les données
