<?php
/**
 * Configuration base de données - Généré par YunoHost
 */

define('DB_HOST', 'localhost');
define('DB_NAME', '__DB_NAME__');
define('DB_USER', '__DB_USER__');
define('DB_PASS', '__DB_PWD__');

try {
    $pdo = new PDO(
        "mysql:host=" . DB_HOST . ";dbname=" . DB_NAME . ";charset=utf8mb4",
        DB_USER,
        DB_PASS,
        [
            PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            PDO::ATTR_EMULATE_PREPARES => false
        ]
    );
} catch(PDOException $e) {
    die("Erreur de connexion à la base de données");
}
