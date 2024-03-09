<?php

try {
    $pdo = new PDO('mysql:host=localhost;dbname=test1_ambw_c14210004', 'root', '');
} catch(\PDOException $e) {
    die('Gagal tekoneksi ke database');
}