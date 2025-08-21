







*** Settings ***
Documentation    1 - Crie um arquivo de teste novo;
...    2 - Crie uma variável do tipo DICIONÁRIO na seção de variáveis globais que contenha nela os meses do ano e, para cada mês, informe o número de dias desse mês;
...    3 - Crie um teste que imprima no Console (Log To Console) cada mês e a sua respectiva quantidade de dias.
...    4 - Rode os testes e confira se logou tudo certinho!

Library    Collections

*** Variables ***

#meses do ano
&{Pessoa}    nome=Marcelo Schneider    idade=42    sexo=masculino

*** Test Cases ***

Imprimir dados da pessoa
    Logar dados das pessoas

*** Keywords ***
Logar dados das pessoas
    Log To Console  nome: ${PESSOA.nome}
    Log To Console  idade: ${PESSOA.idade}
    Log To Console  sexoNome: ${PESSOA.sexo}