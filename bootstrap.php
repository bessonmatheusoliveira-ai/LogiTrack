<?php
require_once __DIR__ . '/config.php';
if (session_status() !== PHP_SESSION_ACTIVE) session_start();
date_default_timezone_set('America/Sao_Paulo');
try {
    $pdo = new PDO(
        'mysql:host='.DB_HOST.';dbname='.DB_NAME.';charset=utf8mb4',
        DB_USER, DB_PASS,
        [PDO::ATTR_ERRMODE=>PDO::ERRMODE_EXCEPTION, PDO::ATTR_DEFAULT_FETCH_MODE=>PDO::FETCH_ASSOC]
    );
} catch (PDOException $ex) {
    http_response_code(500);
    exit('Não foi possível conectar ao banco de dados. Importe database/logitrack.sql no phpMyAdmin e confira config/config.php. Detalhe: '.htmlspecialchars($ex->getMessage()));
}
function e($value): string { return htmlspecialchars((string)$value, ENT_QUOTES, 'UTF-8'); }
function url(string $path=''): string { return rtrim(BASE_URL,'/').'/'.ltrim($path,'/'); }
function redirect(string $path): never { header('Location: '.url($path)); exit; }
function flash(string $type, string $message): void { $_SESSION['flash']=['type'=>$type,'message'=>$message]; }
function getFlash(): ?array { $f=$_SESSION['flash']??null; unset($_SESSION['flash']); return $f; }
function csrfToken(): string { if(empty($_SESSION['csrf'])) $_SESSION['csrf']=bin2hex(random_bytes(32)); return $_SESSION['csrf']; }
function verifyCsrf(): void { if(!hash_equals($_SESSION['csrf']??'', $_POST['csrf']??'')) { http_response_code(419); exit('Sessão expirada. Volte e tente novamente.'); } }
function post(string $key, $default='') { return trim((string)($_POST[$key]??$default)); }
