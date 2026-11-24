<?php
header("Content-Type: application/json; charset=utf-8");
include "conexao.php";

$resultado = $conn->query("SELECT id, nome, descricao, preco, imagem, pagina FROM servicos ORDER BY id");

$lista = [];
while ($linha = $resultado->fetch_assoc()) {
    $lista[] = $linha;
}

echo json_encode($lista);
