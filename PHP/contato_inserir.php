<?php
header("Content-Type: application/json; charset=utf-8");
include "conexao.php";

$nome = trim($_POST["nome"] ?? "");
$email = trim($_POST["email"] ?? "");
$mensagem = trim($_POST["mensagem"] ?? "");

if ($nome == "" || $email == "" || $mensagem == "") {
    echo json_encode(["ok" => false, "msg" => "Preencha todos os campos."]);
    exit;
}

$sql = $conn->prepare("INSERT INTO contatos (nome, email, mensagem) VALUES (?, ?, ?)");
$sql->bind_param("sss", $nome, $email, $mensagem);

if ($sql->execute()) {
    echo json_encode(["ok" => true, "msg" => "Mensagem enviada! Em breve entraremos em contato."]);
} else {
    echo json_encode(["ok" => false, "msg" => "Erro ao salvar a mensagem."]);
}
