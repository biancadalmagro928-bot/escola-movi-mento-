<?php
$servidor = "localhost";
$usuario = "root";
$senha = "";
$banco = "escola_movimento";

$conn = new mysqli($servidor, $usuario, $senha, $banco);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["ok" => false, "msg" => "Nao foi possivel conectar no banco"]);
    exit;
}

$conn->set_charset("utf8mb4");
