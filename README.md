# QODEX – Base de données relationnelle

## Description du projet

Ce projet a pour objectif la conception et la mise en place d’une base de données relationnelle robuste pour la plateforme web **Qodex**.

Qodex est une plateforme dédiée à l’organisation et à la participation à des hackathons. Elle permet de gérer :

- les utilisateurs (enseignants et étudiants),
- les catégories de quiz,
- les quiz créés par des enseignants,
- les questions associées à chaque quiz,
- les résultats obtenus par les étudiants.

La base de données est conçue pour garantir l’intégrité des données, la cohérence du modèle et une bonne évolutivité.

---

## Objectifs pédagogiques

- Concevoir un schéma relationnel cohérent à partir d’un cahier des charges.  
- Traduire un modèle conceptuel de données en SQL (DDL).  
- Mettre en place les contraintes d’intégrité (clés primaires, clés étrangères, types, contraintes).  
- Manipuler les données avec des requêtes SQL (DML).  
- Normaliser les tables (1NF, 2NF, 3NF).  

---

## Technologies utilisées

- SGBD : MySQL  
- Langage : SQL (DDL, DML)  
- Outils possibles :  
  - MySQL Shell / MySQL CLI  
  - MySQL Workbench ou équivalent  
  - PowerShell / Terminal pour l’exécution des scripts  

---

## Modèle de données

La base de données Qodex est structurée autour des tables suivantes.

### Table `utilisateurs`

Représente les enseignants et les étudiants.

- `ID_utilisateur` (INT, PK, AUTO_INCREMENT)  
- `Nom` (VARCHAR(50))  
- `email` (VARCHAR(50))  
- `motdepasse` (VARCHAR(50))  
- `role` (ENUM: `etudiant`, `enseignant`)  

### Table `categories`

Représente les catégories de quiz.

- `id_categories` (INT, PK, AUTO_INCREMENT)  
- `Nom_categorie` (VARCHAR(50))  

### Table `quiz`

Représente les quiz créés par les enseignants.

- `id_quiz` (INT, PK, AUTO_INCREMENT)  
- `titre_quiz` (VARCHAR(50))  
- `description` (VARCHAR(50))  
- `id_categories` (INT, FK vers `categories.id_categories`)  
- `id_enseignant` (INT, FK vers `utilisateurs.ID_utilisateur`)  
- `duree_minutes` (INT)  

### Table `questions`

Représente les questions appartenant à un quiz.

- `id_question` (INT, PK, AUTO_INCREMENT)  
- `text_question` (TEXT)  
- `reponse_correct` (TEXT)  
- `points` (INT)  
- `id_quiz` (INT, FK vers `quiz.id_quiz`)  

### Table `resultat`

Représente les résultats obtenus par les étudiants.

- `id_resultat` (INT, PK, AUTO_INCREMENT)  
- `score` (INT)  
- `datepassage` (TIMESTAMP, défaut `CURRENT_TIMESTAMP`)  
- `id_etudiants` (INT, FK vers `utilisateurs.ID_utilisateur`)  
- `id_quiz` (INT, FK vers `quiz.id_quiz`)  

---

## Relations

- Un enseignant peut créer plusieurs quiz.  
- Un quiz appartient à une seule catégorie.  
- Un quiz contient plusieurs questions.  
- Un étudiant peut passer plusieurs quiz et obtenir plusieurs résultats.  

Ces relations sont assurées par des clés étrangères entre les tables.

---

## Structure du dépôt

Organisation recommandée des fichiers du projet :

- `README.md`  
  Documentation du projet (présent fichier).  

- `schema.sql`  
  Script de création de la base de données et des tables (DDL).  

- `data.sql`  
  Script d’insertion de données d’exemple (INSERT).  

- `queries.sql`  
  Script contenant les requêtes SQL demandées dans le sujet.  

- `erd_qodex.png` ou `erd_qodex.pdf`  
  Diagramme Entité-Relation (ERD) de la base de données.  

---

## Installation et utilisation

### 1. Création de la base de données

```sql
CREATE DATABASE qodex;
USE qodex;
```

### 2. Création du schéma

```sql
SOURCE schema.sql;
```

### 3. Insertion des données d’exemple

```sql
SOURCE data.sql;
```

### 4. Exécution des requêtes

```sql
SOURCE queries.sql;
```

### 5. Vérification rapide des données

```sql
SELECT * FROM utilisateurs;
SELECT * FROM categories;
SELECT * FROM quiz;
SELECT * FROM questions;
SELECT * FROM resultat;
```

---

## Requêtes SQL du projet

Les requêtes suivantes sont implémentées dans le fichier `queries.sql` :

1. Ajouter un nouveau quiz créé par un enseignant.  
2. Modifier la durée d’un quiz existant.  
3. Afficher tous les utilisateurs.  
4. Afficher uniquement les noms et emails des utilisateurs.  
5. Afficher tous les quiz.  
6. Afficher uniquement les titres des quiz.  
7. Afficher toutes les catégories.  
8. Afficher les utilisateurs qui sont enseignants.  
9. Afficher les utilisateurs qui sont étudiants.  
10. Afficher les quiz de durée supérieure à 30 minutes.  
11. Afficher les quiz de durée inférieure ou égale à 45 minutes.  
12. Afficher les questions valant plus de 5 points.  
13. Afficher les quiz de durée entre 20 et 40 minutes.  
14. Afficher les résultats avec un score supérieur ou égal à 60.  
15. Afficher les résultats avec un score inférieur à 50.  
16. Afficher les questions valant entre 5 et 15 points.  
17. Afficher les quiz créés par l’enseignant avec `id_enseignant = 1`.  
18. Afficher tous les quiz triés par durée (du plus court au plus long).  
19. Afficher tous les résultats triés par score (du plus élevé au plus faible).  
20. Afficher les 5 meilleurs scores.  
21. Afficher les questions triées par points (du plus faible au plus élevé).  
22. Afficher les 3 derniers résultats (triés par `datepassage` décroissante).  
23. Afficher le nom de chaque quiz avec sa catégorie.  

---

## Normalisation

Les tables sont conçues pour respecter au minimum :

- Première forme normale (1NF) :  
  valeurs atomiques, pas de répétitions de groupes de colonnes.  

- Deuxième forme normale (2NF) :  
  toutes les colonnes non-clés dépendent entièrement de la clé primaire.  

- Troisième forme normale (3NF) :  
  aucune dépendance transitive entre attributs non-clés.  

---

## Évolutions possibles

- Ajout de rôles supplémentaires (organisateur, mentor, sponsor).  
- Gestion des équipes de hackathon.  
- Ajout d’un historique détaillé des tentatives de quiz.  
- Gestion des sessions de hackathon (dates, lieux, thématiques).  
- Ajout d’index pour optimiser les requêtes les plus fréquentes.  
