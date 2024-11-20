<?php

require_once "CalculoNota.php";

if (!empty($_POST['inputNot1']) && !empty($_POST["inputNot2"])){
    $nota1 = $_POST["inputNot1"];
    $nota2 = $_POST["inputNot2"];
}

// Inicializando o array para armazenar os professores
$professores = [];

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Pegando os dados do formulário
    $cpf = $_POST['cpf'] ?? '';
    $senha = $_POST['senha'] ?? '';

    // Validação de CPF e senha
    if (empty($cpf) || empty($senha)) {
        echo "Por favor, preencha todos os campos.<br>";
    } elseif (!validarCpf($cpf)) {
        echo "CPF inválido!<br>";
    } elseif (strlen($senha) < 6) {
        echo "A senha deve ter pelo menos 6 caracteres.<br>";
    } else {
        // Se os dados forem válidos, adiciona o professor ao array
        $professores[] = ['cpf' => $cpf, 'senha' => password_hash($senha, PASSWORD_DEFAULT)];
        echo "Professor adicionado com sucesso!<br>";
    }
}

// Função para validar CPF
function validarCpf($cpf) {
    // Verifica se o CPF possui 11 dígitos
    $cpf = preg_replace('/[^0-9]/', '', $cpf);
    if (strlen($cpf) !== 11) {
        return false;
    }

    // Verifica se o CPF é válido (simples verificação de repetição)
    if (preg_match('/^(\d)\1{10}$/', $cpf)) {
        return false; // CPF com números repetidos, como 111.111.111.11
    }

    // Algoritmo de validação de CPF
    $soma = 0;
    for ($i = 0; $i < 9; $i++) {
        $soma += $cpf[$i] * (10 - $i);
    }

    $resto = $soma % 11;
    $digito1 = ($resto < 2) ? 0 : 11 - $resto;

    $soma = 0;
    for ($i = 0; $i < 10; $i++) {
        $soma += $cpf[$i] * (11 - $i);
    }

    $resto = $soma % 11;
    $digito2 = ($resto < 2) ? 0 : 11 - $resto;

    return ($cpf[9] == $digito1 && $cpf[10] == $digito2);
}

?>


