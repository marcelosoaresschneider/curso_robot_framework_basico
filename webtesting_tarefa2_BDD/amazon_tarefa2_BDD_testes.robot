
*** Settings ***
Documentation    Essa suite testa o site da Amazon.com.br
Resource         amazon_tarefa2_BDD_resources.robot
Test Setup       Abrir o navegador
Test Teardown    Fechar o navegador





*** Test Cases ***

# Caso de Teste 01 - Acesso ao menu "Eletrônicos"
#     [Documentation]    Esse teste verifica o menu eletônicos do site da Amazon.com.br
#     ...                e verifica a categoria Computadores e Informática
#     [Tags]             menus
#     Dado que estou na home page da Amazon.com.br
#     Quando acessar o menu "Eletrônicos"
#     Então o título da página deve ficar "Eletrônicos e Tecnologia | Amazon.com.br"
#     E a categoria "Computadores e Informática" deve ser exibida na página



# Caso de Teste 02 - Pesquisa de um Produto
#     [Documentation]    Esse teste verifica a busca de um produto
#     [Tags]             Busca por produto
#     Dado que estou na home page da Amazon.com.br
#     Quando pesquisar pelo produto "Xbox Series S"
#     Então um produto da linha "Xbox Series S" deve ser mostrado na página


Caso de Teste 03 - Adicionar Produto no Carrinho
    [Documentation]    Esse teste verifica a adição de um produto no carrinho de compras
    [Tags]             adicionar_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então um produto da linha "Xbox Series S" deve ser mostrado na página
    E adiciono o produto "Console Xbox Series S" no carrinho
    E verifico se o produto "Console Xbox Series S" foi adicionado com sucesso

Caso de Teste 04 - Remover Produto do Carrinho
    [Documentation]    Esse teste verifica a remoção de um produto no carrinho de compras
    [Tags]             remover_carrinho
    Dado que estou na home page da Amazon.com.br
    Quando pesquisar pelo produto "Xbox Series S"
    Então um produto da linha "Xbox Series S" deve ser mostrado na página
    E adiciono o produto "Console Xbox Series S" no carrinho
    E verifico se o produto "Console Xbox Series S" foi adicionado com sucesso
    Então removo o produto "Console Xbox Series S" do carrinho
    E Verifico se o carrinho fica vazio