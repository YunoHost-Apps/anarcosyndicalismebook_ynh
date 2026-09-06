<?php
/**
 * Configuration base de données - Généré par YunoHost
 */

if (file_exists(__DIR__ . '/i18n.php')) {
    require_once __DIR__ . '/i18n.php';
}
if (file_exists(__DIR__ . '/url.php')) {
    require_once __DIR__ . '/url.php';
}

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

    $autoMigrations = __DIR__ . '/auto_migrations.php';
    if (is_readable($autoMigrations)) {
        require_once $autoMigrations;
        runAutomaticMigrations($pdo);
    }
} catch(PDOException $e) {
    error_log("DB Connection Error: " . $e->getMessage());
    die("Erreur de connexion à la base de données");
}
