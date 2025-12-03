mysql> use qodex;
Database changed
mysql> insert into quiz (id_quiz, titre_quiz, description, id_categories, id_enseignant,duree_minutes) values
    -> ^C
mysql> insert into quiz ( titre_quiz, description, id_categories, id_enseignant,duree_minutes) values
    -> ('htmlQuiz','quiz pour tester ta c'
    -> ^C
mysql> ^C
mysql> show tables ;
+-----------------+
| Tables_in_qodex |
+-----------------+
| categories      |
| questions       |
| quiz            |
| resultat        |
| utilisateurs    |
+-----------------+
5 rows in set (0.00 sec)

mysql> insert into categories(id_categories, Nom_categorie) values
    -> ('1','culture informatiqiue');
Query OK, 1 row affected (0.03 sec)

mysql> insert into utilisateurs(Nom , email , motdepasse, role) values
    -> ('amine','amine@youcode','amine1234','formateur');
ERROR 1265 (01000): Data truncated for column 'role' at row 1
mysql> insert into utilisateurs(Nom , email , motdepasse, role) values
    -> ('amine','amine@youcode','amine1234','enseignant');
Query OK, 1 row affected (0.02 sec)

mysql> insert into quiz (titre_quiz, description, id_categories, id_enseignant,duree_minutes) values
    ->  ('htmlQuiz','quiz pour tester ta comprehention en html','1','1','20);
    '> ;
    '> insert into quiz (titre_quiz, description, id_categories, id_enseignant,duree_minutes) values
    '> ^C
mysql> ^C
mysql> insert into quiz (titre_quiz, description, id_categories, id_enseignant,duree_minutes) values
    ->  ('htmlQuiz','quiz pour tester ta comprehention en html','1','1','20');
Query OK, 1 row affected (0.02 sec)

mysql> pwd
    -> ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'pwd' at line 1
mysql> pwd;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'pwd' at line 1
mysql> quit;
mysql> update quiz
    -> set duree_minutes ='30';
Query OK, 1 row affected (0.02 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> describe utilisateurs;
+----------------+-------------------------------+------+-----+---------+----------------+
| Field          | Type                          | Null | Key | Default | Extra          |
+----------------+-------------------------------+------+-----+---------+----------------+
| ID_utilisateur | int                           | NO   | PRI | NULL    | auto_increment |
| Nom            | varchar(50)                   | NO   |     | NULL    |                |
| email          | varchar(50)                   | NO   |     | NULL    |                |
| motdepasse     | varchar(50)                   | NO   |     | NULL    |                |
| role           | enum('etudiant','enseignant') | YES  |     | NULL    |                |
+----------------+-------------------------------+------+-----+---------+----------------+
5 rows in set (0.01 sec)

mysql> select * from utilisateur; 
ERROR 1146 (42S02): Table 'qodex.utilisateur' doesn't exist
mysql> select * from utilisateurs; 
+----------------+-------+---------------+------------+------------+
| ID_utilisateur | Nom   | email         | motdepasse | role       |
+----------------+-------+---------------+------------+------------+
|              1 | amine | amine@youcode | amine1234  | enseignant |
+----------------+-------+---------------+------------+------------+
1 row in set (0.00 sec)

mysql> select Nom , email from utilisateurs;
+-------+---------------+
| Nom   | email         |
+-------+---------------+
| amine | amine@youcode |
+-------+---------------+
1 row in set (0.00 sec)

mysql> select * from quiz;
+---------+------------+-------------------------------------------+---------------+---------------+---------------+
| id_quiz | titre_quiz | description                               | id_categories | id_enseignant | duree_minutes |
+---------+------------+-------------------------------------------+---------------+---------------+---------------+
|       1 | htmlQuiz   | quiz pour tester ta comprehention en html |             1 |             1 |            30 |
+---------+------------+-------------------------------------------+---------------+---------------+---------------+
1 row in set (0.00 sec)

mysql> select titre_quiz from utilisateurs;
ERROR 1054 (42S22): Unknown column 'titre_quiz' in 'field list'
mysql> select titre_quiz from quiz;
+------------+
| titre_quiz |
+------------+
| htmlQuiz   |
+------------+
1 row in set (0.00 sec)

mysql> select * from categories;
+---------------+-----------------------+
| id_categories | Nom_categorie         |
+---------------+-----------------------+
|             1 | culture informatiqiue |
+---------------+-----------------------+
1 row in set (0.00 sec)

mysql> select * from utilisateurs 
    -> where role='enseignant';
+----------------+-------+---------------+------------+------------+
| ID_utilisateur | Nom   | email         | motdepasse | role       |
+----------------+-------+---------------+------------+------------+
|              1 | amine | amine@youcode | amine1234  | enseignant |
+----------------+-------+---------------+------------+------------+
1 row in set (0.00 sec)

mysql> select * from categories;
+---------------+-----------------------+
| id_categories | Nom_categorie         |
+---------------+-----------------------+
|             1 | culture informatiqiue |
+---------------+-----------------------+
1 row in set (0.00 sec)

mysql> select * from utilisateurs 
    -> where role='etudiant';
Empty set (0.00 sec)

mysql> DESCRIBE utilisateurs;
+----------------+-------------------------------+------+-----+---------+----------------+
| Field          | Type                          | Null | Key | Default | Extra          |
+----------------+-------------------------------+------+-----+---------+----------------+
| ID_utilisateur | int                           | NO   | PRI | NULL    | auto_increment |
| Nom            | varchar(50)                   | NO   |     | NULL    |                |
| email          | varchar(50)                   | NO   |     | NULL    |                |
| motdepasse     | varchar(50)                   | NO   |     | NULL    |                |
| role           | enum('etudiant','enseignant') | YES  |     | NULL    |                |
+----------------+-------------------------------+------+-----+---------+----------------+
5 rows in set (0.00 sec)

mysql> DESCRIBE categories;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| id_categories | int         | NO   | PRI | NULL    | auto_increment |
| Nom_categorie | varchar(50) | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
2 rows in set (0.00 sec)

mysql> DESCRIBE quiz;
+---------------+-------------+------+-----+---------+----------------+
| Field         | Type        | Null | Key | Default | Extra          |
+---------------+-------------+------+-----+---------+----------------+
| id_quiz       | int         | NO   | PRI | NULL    | auto_increment |
| titre_quiz    | varchar(50) | NO   |     | NULL    |                |
| description   | varchar(50) | NO   |     | NULL    |                |
| id_categories | int         | NO   | MUL | NULL    |                |
| id_enseignant | int         | NO   | MUL | NULL    |                |
| duree_minutes | int         | NO   |     | NULL    |                |
+---------------+-------------+------+-----+---------+----------------+
6 rows in set (0.00 sec)

mysql> DESCRIBE questions;
+-----------------+------+------+-----+---------+----------------+
| Field           | Type | Null | Key | Default | Extra          |
+-----------------+------+------+-----+---------+----------------+
| id_question     | int  | NO   | PRI | NULL    | auto_increment |
| text_question   | text | NO   |     | NULL    |                |
| reponse_correct | text | NO   |     | NULL    |                |
| points          | int  | NO   |     | NULL    |                |
| id_quiz         | int  | NO   | MUL | NULL    |                |
+-----------------+------+------+-----+---------+----------------+
5 rows in set (0.02 sec)

mysql> DESCRIBE resultat;
+--------------+-----------+------+-----+-------------------+-------------------+
| Field        | Type      | Null | Key | Default           | Extra             |
+--------------+-----------+------+-----+-------------------+-------------------+
| id_resultat  | int       | NO   | PRI | NULL              | auto_increment    |
| score        | int       | NO   |     | NULL              |                   |
| datepassage  | timestamp | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED |
| id_etudiants | int       | NO   | MUL | NULL              |                   |
| id_quiz      | int       | NO   |     | NULL              |                   |
+--------------+-----------+------+-----+-------------------+-------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM utilisateurs;
+----------------+-------+---------------+------------+------------+
| ID_utilisateur | Nom   | email         | motdepasse | role       |
+----------------+-------+---------------+------------+------------+
|              1 | amine | amine@youcode | amine1234  | enseignant |
+----------------+-------+---------------+------------+------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM categories;
+---------------+-----------------------+
| id_categories | Nom_categorie         |
+---------------+-----------------------+
|             1 | culture informatiqiue |
+---------------+-----------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM quiz;
+---------+------------+-------------------------------------------+---------------+---------------+---------------+
| id_quiz | titre_quiz | description                               | id_categories | id_enseignant | duree_minutes |
+---------+------------+-------------------------------------------+---------------+---------------+---------------+
|       1 | htmlQuiz   | quiz pour tester ta comprehention en html |             1 |             1 |            30 |
+---------+------------+-------------------------------------------+---------------+---------------+---------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM questions;
Empty set (0.00 sec)

mysql> SELECT * FROM resultat;
Empty set (0.00 sec)

mysql> INSERT INTO utilisateurs (Nom, email, motdepasse, role) VALUES
    -> ('Sara', 'sara@example.com', 'sara123', 'enseignant'),
    -> ('Yassine', 'yassine@example.com', 'yassine123', 'enseignant'),
    -> ('Mohamed', 'mohamed@example.com', 'moh123', 'enseignant'),
    -> ('Amina', 'amina@example.com', 'amina123', 'enseignant'),
    -> 
    -> ('Rachid', 'rachid@example.com', 'rachid123', 'etudiant'),
    -> ('Fatima', 'fatima@example.com', 'fatima123', 'etudiant'),
    -> ('Omar', 'omar@example.com', 'omar123', 'etudiant'),
    -> ('Salma', 'salma@example.com', 'salma123', 'etudiant'),
    -> ('Khalid', 'khalid@example.com', 'khalid123', 'etudiant');
Query OK, 9 rows affected (0.02 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO categories (Nom_categorie) VALUES
    -> ('HTML'),
    -> ('CSS'),
    -> ('JavaScript'),
    -> ('SQL'),
    -> ('R‚seaux'),
    -> ('Python'),
    -> ('Java'),
    -> ('S‚curit‚'),
    -> ('Data Science');
Query OK, 9 rows affected (0.01 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO quiz (titre_quiz, description, id_categories, id_enseignant, duree_minutes) VALUES
    -> ('CSS Layout', 'Quiz sur Flexbox et Grid', 2, 2, 25),
    -> ('JS Intro', 'Quiz sur les bases JavaScript', 3, 3, 30),
    -> ('SQL D‚butant', 'Quiz sur les requˆtes SQL', 4, 4, 40),
    -> ('R‚seaux 101', 'Quiz sur les couches OSI', 5, 5, 35),
    -> ('Python Basics', 'Quiz sur Python d‚butant', 6, 1, 30),
    -> ('Java Concepts', 'Quiz sur la POO', 7, 2, 45),
    -> ('Cyber S‚curit‚', 'Quiz sur la s‚curit‚', 8, 3, 50),
    -> ('Data Intro', 'Quiz data science', 9, 4, 25),
    -> ('Linux Admin', 'Quiz Linux commandes', 10, 5, 20);
Query OK, 9 rows affected (0.02 sec)
Records: 9  Duplicates: 0  Warnings: 0

mysql> INSERT INTO questions (text_question, reponse_correcte, points, id_quiz) VALUES
    -> ('Que signifie HTML ?', 'HyperText Markup Language', 5, 1),
    -> ('Balise pour un paragraphe ?', '<p>', 3, 1),
    -> 
    -> ('Display flex appartient … ?', 'CSS', 5, 2),
    -> ('M‚thode JS pour afficher du texte ?', 'console.log()', 4, 3),
    -> 
    -> ('Commande SQL pour s‚lectionner ?', 'SELECT', 5, 4),
    -> ('Combien de couches OSI ?', '7', 3, 5),
    -> 
    -> ('Mot-cl‚ pour une classe Java ?', 'class', 5, 7),
    -> ('Fonction Python pour lire ?', 'input()', 2, 6),
    -> 
    -> ('Commande Linux pour lister ?', 'ls', 3, 10),
    -> ('Que signifie SQL ?', 'Structured Query Language', 5, 4);
ERROR 1054 (42S22): Unknown column 'reponse_correcte' in 'field list'
mysql> INSERT INTO questions (text_question, reponse_correct, points, id_quiz) VALUES
    -> ('Que signifie HTML ?', 'HyperText Markup Language', 5, 1),
    -> ('Balise pour un paragraphe ?', '<p>', 3, 1),
    -> 
    -> ('Display flex appartient … ?', 'CSS', 5, 2),
    -> ('M‚thode JS pour afficher du texte ?', 'console.log()', 4, 3),
    -> 
    -> ('Commande SQL pour s‚lectionner ?', 'SELECT', 5, 4),
    -> ('Combien de couches OSI ?', '7', 3, 5),
    -> 
    -> ('Mot-cl‚ pour une classe Java ?', 'class', 5, 7),
    -> ('Fonction Python pour lire ?', 'input()', 2, 6),
    -> 
    -> ('Commande Linux pour lister ?', 'ls', 3, 10),
    -> ('Que signifie SQL ?', 'Structured Query Language', 5, 4);
Query OK, 10 rows affected (0.02 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> 
mysql> INSERT INTO resultat (score, id_etudiants, id_quiz) VALUES
    -> (85, 6, 1),
    -> (70, 7, 1),
    -> (65, 8, 2),
    -> (90, 9, 3),
    -> (55, 10, 4),
    -> (78, 6, 5),
    -> (88, 7, 6),
    -> (92, 8, 7),
    -> (60, 9, 8),
    -> (73, 10, 9);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM utilisateurs;
+----------------+---------+---------------------+------------+------------+
| ID_utilisateur | Nom     | email               | motdepasse | role       |
+----------------+---------+---------------------+------------+------------+
|              1 | amine   | amine@youcode       | amine1234  | enseignant |
|              2 | Sara    | sara@example.com    | sara123    | enseignant |
|              3 | Yassine | yassine@example.com | yassine123 | enseignant |
|              4 | Mohamed | mohamed@example.com | moh123     | enseignant |
|              5 | Amina   | amina@example.com   | amina123   | enseignant |
|              6 | Rachid  | rachid@example.com  | rachid123  | etudiant   |
|              7 | Fatima  | fatima@example.com  | fatima123  | etudiant   |
|              8 | Omar    | omar@example.com    | omar123    | etudiant   |
|              9 | Salma   | salma@example.com   | salma123   | etudiant   |
|             10 | Khalid  | khalid@example.com  | khalid123  | etudiant   |
+----------------+---------+---------------------+------------+------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM categories;
+---------------+-----------------------+
| id_categories | Nom_categorie         |
+---------------+-----------------------+
|             1 | culture informatiqiue |
|             2 | HTML                  |
|             3 | CSS                   |
|             4 | JavaScript            |
|             5 | SQL                   |
|             6 | R‚seaux               |
|             7 | Python                |
|             8 | Java                  |
|             9 | S‚curit‚              |
|            10 | Data Science          |
+---------------+-----------------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM quiz;
+---------+----------------+-------------------------------------------+---------------+---------------+---------------+
| id_quiz | titre_quiz     | description                               | id_categories | id_enseignant | duree_minutes |
+---------+----------------+-------------------------------------------+---------------+---------------+---------------+
|       1 | htmlQuiz       | quiz pour tester ta comprehention en html |             1 |             1 |            30 |
|       2 | CSS Layout     | Quiz sur Flexbox et Grid                  |             2 |             2 |            25 |
|       3 | JS Intro       | Quiz sur les bases JavaScript             |             3 |             3 |            30 |
|       4 | SQL D‚butant   | Quiz sur les requˆtes SQL                 |             4 |             4 |            40 |
|       5 | R‚seaux 101    | Quiz sur les couches OSI                  |             5 |             5 |            35 |
|       6 | Python Basics  | Quiz sur Python d‚butant                  |             6 |             1 |            30 |
|       7 | Java Concepts  | Quiz sur la POO                           |             7 |             2 |            45 |
|       8 | Cyber S‚curit‚ | Quiz sur la s‚curit‚                      |             8 |             3 |            50 |
|       9 | Data Intro     | Quiz data science                         |             9 |             4 |            25 |
|      10 | Linux Admin    | Quiz Linux commandes                      |            10 |             5 |            20 |
+---------+----------------+-------------------------------------------+---------------+---------------+---------------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM questions;
+-------------+-------------------------------------+---------------------------+--------+---------+
| id_question | text_question                       | reponse_correct           | points | id_quiz |
+-------------+-------------------------------------+---------------------------+--------+---------+
|           1 | Que signifie HTML ?                 | HyperText Markup Language |      5 |       1 |
|           2 | Balise pour un paragraphe ?         | <p>                       |      3 |       1 |
|           3 | Display flex appartient … ?         | CSS                       |      5 |       2 |
|           4 | M‚thode JS pour afficher du texte ? | console.log()             |      4 |       3 |
|           5 | Commande SQL pour s‚lectionner ?    | SELECT                    |      5 |       4 |
|           6 | Combien de couches OSI ?            | 7                         |      3 |       5 |
|           7 | Mot-cl‚ pour une classe Java ?      | class                     |      5 |       7 |
|           8 | Fonction Python pour lire ?         | input()                   |      2 |       6 |
|           9 | Commande Linux pour lister ?        | ls                        |      3 |      10 |
|          10 | Que signifie SQL ?                  | Structured Query Language |      5 |       4 |
+-------------+-------------------------------------+---------------------------+--------+---------+
10 rows in set (0.00 sec)

mysql> SELECT * FROM resultat;
+-------------+-------+---------------------+--------------+---------+
| id_resultat | score | datepassage         | id_etudiants | id_quiz |
+-------------+-------+---------------------+--------------+---------+
|           1 |    85 | 2025-12-02 12:24:06 |            6 |       1 |
|           2 |    70 | 2025-12-02 12:24:06 |            7 |       1 |
|           3 |    65 | 2025-12-02 12:24:06 |            8 |       2 |
|           4 |    90 | 2025-12-02 12:24:06 |            9 |       3 |
|           5 |    55 | 2025-12-02 12:24:06 |           10 |       4 |
|           6 |    78 | 2025-12-02 12:24:06 |            6 |       5 |
|           7 |    88 | 2025-12-02 12:24:06 |            7 |       6 |
|           8 |    92 | 2025-12-02 12:24:06 |            8 |       7 |
|           9 |    60 | 2025-12-02 12:24:06 |            9 |       8 |
|          10 |    73 | 2025-12-02 12:24:06 |           10 |       9 |
+-------------+-------+---------------------+--------------+---------+
10 rows in set (0.00 sec)

mysql> select * from quiz 
    -> where duree_minutes > 0 ;
+---------+----------------+-------------------------------------------+---------------+---------------+---------------+
| id_quiz | titre_quiz     | description                               | id_categories | id_enseignant | duree_minutes |
+---------+----------------+-------------------------------------------+---------------+---------------+---------------+
|       1 | htmlQuiz       | quiz pour tester ta comprehention en html |             1 |             1 |            30 |
|       2 | CSS Layout     | Quiz sur Flexbox et Grid                  |             2 |             2 |            25 |
|       3 | JS Intro       | Quiz sur les bases JavaScript             |             3 |             3 |            30 |
|       4 | SQL D‚butant   | Quiz sur les requˆtes SQL                 |             4 |             4 |            40 |
|       5 | R‚seaux 101    | Quiz sur les couches OSI                  |             5 |             5 |            35 |
|       6 | Python Basics  | Quiz sur Python d‚butant                  |             6 |             1 |            30 |
|       7 | Java Concepts  | Quiz sur la POO                           |             7 |             2 |            45 |
|       8 | Cyber S‚curit‚ | Quiz sur la s‚curit‚                      |             8 |             3 |            50 |
|       9 | Data Intro     | Quiz data science                         |             9 |             4 |            25 |
|      10 | Linux Admin    | Quiz Linux commandes                      |            10 |             5 |            20 |
+---------+----------------+-------------------------------------------+---------------+---------------+---------------+
10 rows in set (0.00 sec)

mysql> where duree_minutes > 30 ;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'where duree_minutes > 30' at line 1
mysql> select * from quiz 
    -> where duree_minutes > 30 ;
+---------+----------------+---------------------------+---------------+---------------+---------------+
| id_quiz | titre_quiz     | description               | id_categories | id_enseignant | duree_minutes |
+---------+----------------+---------------------------+---------------+---------------+---------------+
|       4 | SQL D‚butant   | Quiz sur les requˆtes SQL |             4 |             4 |            40 |
|       5 | R‚seaux 101    | Quiz sur les couches OSI  |             5 |             5 |            35 |
|       7 | Java Concepts  | Quiz sur la POO           |             7 |             2 |            45 |
|       8 | Cyber S‚curit‚ | Quiz sur la s‚curit‚      |             8 |             3 |            50 |
+---------+----------------+---------------------------+---------------+---------------+---------------+
4 rows in set (0.00 sec)

mysql> select * from quiz 
    -> where duree_minutes <= 45 ;
+---------+---------------+-------------------------------------------+---------------+---------------+---------------+
| id_quiz | titre_quiz    | description                               | id_categories | id_enseignant | duree_minutes |
+---------+---------------+-------------------------------------------+---------------+---------------+---------------+
|       1 | htmlQuiz      | quiz pour tester ta comprehention en html |             1 |             1 |            30 |
|       2 | CSS Layout    | Quiz sur Flexbox et Grid                  |             2 |             2 |            25 |
|       3 | JS Intro      | Quiz sur les bases JavaScript             |             3 |             3 |            30 |
|       4 | SQL D‚butant  | Quiz sur les requˆtes SQL                 |             4 |             4 |            40 |
|       5 | R‚seaux 101   | Quiz sur les couches OSI                  |             5 |             5 |            35 |
|       6 | Python Basics | Quiz sur Python d‚butant                  |             6 |             1 |            30 |
|       7 | Java Concepts | Quiz sur la POO                           |             7 |             2 |            45 |
|       9 | Data Intro    | Quiz data science                         |             9 |             4 |            25 |
|      10 | Linux Admin   | Quiz Linux commandes                      |            10 |             5 |            20 |
+---------+---------------+-------------------------------------------+---------------+---------------+---------------+
9 rows in set (0.00 sec)

mysql> SELECT * FROM questions
    -> where notes > 5;
ERROR 1054 (42S22): Unknown column 'notes' in 'where clause'
mysql> SELECT * FROM questions
    -> where points > 5;
Empty set (0.00 sec)

mysql> SELECT * FROM questions
    -> where points >= 5;
+-------------+----------------------------------+---------------------------+--------+---------+
| id_question | text_question                    | reponse_correct           | points | id_quiz |
+-------------+----------------------------------+---------------------------+--------+---------+
|           1 | Que signifie HTML ?              | HyperText Markup Language |      5 |       1 |
|           3 | Display flex appartient … ?      | CSS                       |      5 |       2 |
|           5 | Commande SQL pour s‚lectionner ? | SELECT                    |      5 |       4 |
|           7 | Mot-cl‚ pour une classe Java ?   | class                     |      5 |       7 |
|          10 | Que signifie SQL ?               | Structured Query Language |      5 |       4 |
+-------------+----------------------------------+---------------------------+--------+---------+
5 rows in set (0.00 sec)

mysql> Terminal close -- exit!
mysql> SELECT quiz.titre_quiz, categories.Nom_categorie
    -> FROM quiz
    -> INNER JOIN categories
    -> ON quiz.id_categories = categories.id_categories;
+----------------+-----------------------+
| titre_quiz     | Nom_categorie         |
+----------------+-----------------------+
| htmlQuiz       | culture informatiqiue |
| CSS Layout     | HTML                  |
| JS Intro       | CSS                   |
| SQL D‚butant   | JavaScript            |
| R‚seaux 101    | SQL                   |
| Python Basics  | R‚seaux               |
| Java Concepts  | Python                |
| Cyber S‚curit‚ | Java                  |
| Data Intro     | S‚curit‚              |
| Linux Admin    | Data Science          |
+----------------+-----------------------+
10 rows in set (0.00 sec)

