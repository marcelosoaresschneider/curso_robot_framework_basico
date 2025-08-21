







*** Settings ***
Documentation    1 - Crie um arquivo de teste novo;
...    2 - Crie uma variável do tipo LISTA na seção de variáveis globais que contenha todos os meses do ano;
...    3 - Crie um teste que imprima no Console (Log To Console) cada item dessa lista (não use FOR, imprima um a um).
...    4 - Rode os testes e confira se logou tudo certinho!
...    Perguntas dessa tarefa: Como você implementou? Conta pra gente! Cole os trechos do código criados/alterados.

Library    Collections

*** Variables ***

#meses do ano
@{MESES_ANOS}    Janeiro   fevereiro   março   abril   maio   junho   julho   agosto  setembro   outubro   novembro   dezembro
@{frutas}    maça    banana    jaca    melancia

*** Test Cases ***

Imprimir meses do ano
    Logar os meses do ano

Imprimir frutas
    Logar as frutas nas posições

*** Keywords ***

Logar os meses do ano
    Log To Console   mês 01: ${MESES_ANOS[0]}
    Log To Console  mês 02: ${MESES_ANOS[1]} 
    Log To Console  mês 03: ${MESES_ANOS[2]} 
    Log To Console  mês 04: ${MESES_ANOS[3]} 
    Log To Console  mês 05: ${MESES_ANOS[4]} 
    Log To Console  mês 06: ${MESES_ANOS[5]} 
    Log To Console  mês 07: ${MESES_ANOS[6]} 
    Log To Console  mês 08: ${MESES_ANOS[7]} 
    Log To Console  mês 09: ${MESES_ANOS[8]} 
    Log To Console  mês 10: ${MESES_ANOS[9]} 
    Log To Console  mês 11: ${MESES_ANOS[10]} 
    Log To Console  mês 12: ${MESES_ANOS[11]} 
   





Logar as frutas nas posições      
    Log To Console   Fruta posicao 01 MAÇA: ${FRUTAS[0]}
    Log To Console   Fruta posicao 03 JACA: ${FRUTAS[2]}