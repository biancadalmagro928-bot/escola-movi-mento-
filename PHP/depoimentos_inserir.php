<?php
header("Content-Type: application/json; charset=utf-8");
include "conexao.php";

$nome = trim($_POST["nome"] ?? "");
$mensagem = trim($_POST["mensagem"] ?? "");

if ($nome == "" || $mensagem == "") {
    echo json_encode(["ok" => false, "msg" => "Preencha seu nome e o depoimento."]);
    exit;
}

$sql = $conn->prepare("INSERT INTO depoimentos (nome, mensagem, data_depoimento) VALUES (?, ?, CURDATE())");
$sql->bind_param("ss", $nome, $mensagem);

if ($sql->execute()) {
    echo json_encode(["ok" => true, "msg" => "Obrigada pelo seu depoimento!"]);
} else {
    echo json_encode(["ok" => false, "msg" => "Erro ao salvar o depoimento."]);
}
