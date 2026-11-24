<?php
header("Content-Type: application/json; charset=utf-8");
include "conexao.php";

$conn->query("SET lc_time_names = 'pt_BR'");

$resultado = $conn->query("SELECT id, nome, mensagem, foto,
    DATE_FORMAT(data_depoimento, '%e de %M de %Y') AS data
    FROM depoimentos ORDER BY data_depoimento DESC, id DESC");

$lista = [];
while ($linha = $resultado->fetch_assoc()) {
    $lista[] = $linha;
}

echo json_encode($lista);
