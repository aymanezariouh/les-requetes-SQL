<?php
require_once '../../config/database.php';
require_once '../../classes/Database.php';
require_once '../../classes/Security.php';
require_once '../../classes/Category.php';
require_once '../../classes/Quiz.php';
$DB = Database::getInstance();

$categ_req = $DB->query("SELECT * FROM  categories");
$Categories= $categ_req -> fetchAll();

$quiz_req = $DB->query("SELECT * FROM quiz where is_active = 1");
$quizes = $quiz_req-> fetchAll();

$resul_req = $DB-> query(" SELECT quiz.titre, results.score, results.total_questions , results.created_at FROM results INNER JOIN quiz on results.quiz_id = quiz.id");
$results = $resul_req ->fetchAll();
echo "<pre>";
var_dump($_SESSION);
echo "</pre>";
// $teacherId = $_SESSION['user_id'];
// $userName = $_SESSION['user_role'];

// var_dump($teacherId);
// var_dump($userName);
?>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <title>Dashboard Étudiant – Quiz</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <style>
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
    }

    body {
      background: #f4f6f8;
      color: #333;
    }

    .layout {
      display: grid;
      grid-template-columns: 220px 1fr;
      min-height: 100vh;
    }

    /* Sidebar navigation étudiant */
    .sidebar {
      background: #1e293b;
      color: #fff;
      padding: 20px;
    }

    .sidebar h2 {
      font-size: 18px;
      margin-bottom: 20px;
    }

    .sidebar a {
      display: block;
      padding: 10px;
      margin-bottom: 5px;
      color: #cbd5e1;
      text-decoration: none;
      border-radius: 6px;
    }

    .sidebar a.active,
    .sidebar a:hover {
      background: #334155;
      color: #fff;
    }

    /* Main content */
    .main {
      padding: 20px;
    }

    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 25px;
    }

    .header h1 {
      font-size: 22px;
    }

    .student-info {
      font-size: 14px;
      color: #475569;
    }

    /* Sections */
    .section {
      background: #fff;
      padding: 15px;
      border-radius: 8px;
      margin-bottom: 20px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.08);
    }

    .section h2 {
      font-size: 18px;
      margin-bottom: 15px;
    }

    /* Catégories */
    .category {
      padding: 10px;
      border: 1px solid #e5e7eb;
      border-radius: 6px;
      margin-bottom: 10px;
    }

    /* Quiz */
    .quiz {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 10px;
      border-bottom: 1px solid #e5e7eb;
    }

    .quiz:last-child {
      border-bottom: none;
    }

    .quiz a {
      color: #2563eb;
      text-decoration: none;
      font-weight: bold;
    }

    /* Historique */
    table {
      width: 100%;
      border-collapse: collapse;
      font-size: 14px;
    }

    th, td {
      padding: 10px;
      border-bottom: 1px solid #e5e7eb;
      text-align: left;
    }

    th {
      background: #f1f5f9;
    }

    /* Responsive */
    @media (max-width: 768px) {
      .layout {
        grid-template-columns: 1fr;
      }

      .sidebar {
        display: none;
      }
    }
  </style>
</head>

<body>

<div class="layout">

  <!-- Navigation Étudiant -->
  <nav class="sidebar">
    <h2>Étudiant</h2>
    <a href="#" class="active">Dashboard</a>
    <a href="#">Catégories</a>
    <a href="#">Quiz</a>
    <a href="#">Historique</a>
    <a href="#">Déconnexion</a>
  </nav>

  <!-- Contenu principal -->
  <main class="main">

    <!-- En-tête -->
    <div class="header">
      <h1>Dashboard Étudiant</h1>
      <div class="student-info">
      </div>
    </div>
    <!-- Catégories (US1) -->
    <section class="section">
      <h2>Catégories de Quiz</h2>
    <?php foreach($Categories as $categori)?>

      <div class="category">
        <strong>
            <?= $categori['nom']; ?></strong><br>
        <?= $categori['description']; ?>
      </div>
      
    </section>

    <!-- Quiz actifs par catégorie (US2) -->
    <section class="section">
      <h2>Quiz Disponibles</h2>

      <div class="quiz">
        <?php foreach($quizes as $quiz)?>
        <div>
          <strong><?= $quiz['titre']?></strong><br>
          <small><?= $quiz['description']?></small>
        </div>
        <a href="#">Démarrer</a>
      </div>

    </section>

    <!-- Historique personnel (US5) -->
    <section class="section">
      <h2>Mon Historique</h2>

      <table>
        <thead>
          <tr>
            <th>Quiz</th>
            <th>Score</th>
            <th>Total Questions</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
            <?php foreach($results AS $result) {?>
          <tr>
            <td><?= $result['titre'] ?></td>
            <td><?= $result['score'] ?></td>
            <td><?= $result['total_questions'] ?></td>
            <td><?= $result['created_at'] ?></td>
          </tr>
<?php } ; ?>
        </tbody>
      </table>
    </section>

  </main>

</div>

</body>
</html>
