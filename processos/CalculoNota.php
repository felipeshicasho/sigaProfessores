<?php

    function media($nota1, $nota2){
        // Calcula a média das duas notas
        $result = ($nota1 + $nota2) / 2;  
        
        // Se a média for maior ou igual a 6, aluno passou
        if ($result >= 6){
            echo "Passou na Matéria! A média final é: " . $result . "<br>";
        }
        else{
            // Se a média for menor que 6, o aluno precisa fazer a P3
            echo "Você não passou na matéria. Sua média foi: " . $result . "<br>";
            echo "Será necessário fazer a P3 (Prova Final).";
        }
        
        // Retorna a média calculada
        return $result;
    }

?>
