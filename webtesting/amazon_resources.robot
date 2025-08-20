*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BROWSER}            chrome
${URL}                https://www.amazon.com.br/?ref_=icp_country_from_us
${MENU_ELETRONICOS}   //a[contains(text(),'Eletrônicos')]  
${TITULO_ELETRONICOS_TECNOLOGIA}    (//span[contains(text(),'Eletrônicos e Tecnologia')])[1]
${CATEGORIA_COMPUTADORES_INFORMATICA}    //*[@id="nav-subnav"]/a[5]/span[1]
${CAMPO_PESQUISA}      (//input[@id='twotabsearchtextbox'])[1]
${BOTAO_PESQUISA}      (//input[@id='nav-search-submit-button'])[1]
${PRODUTO_PESQUISA}    (//span[contains(text(),'Console Xbox Series S')])[1]

*** Keywords ***

Abrir o navegador
    Open Browser    browser=${BROWSER}
    Maximize Browser Window

Fechar o navegador  
    Close Browser  

Acessar a home page do site Amazon.com.br
    Go To    url=${URL}  

Entrar no menu "Eletrônicos"    
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Click Element    locator=${MENU_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"
    Title Should Be    title=${TITULO} 

Verificar se aparece a categoria "${CATEGORIA}" 
    Wait Until Element Is Visible    locator=${CATEGORIA_COMPUTADORES_INFORMATICA}
    Wait Until Element Contains      locator=${CATEGORIA_COMPUTADORES_INFORMATICA}    text=${CATEGORIA}    

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa   
    Wait Until Element Is Visible    locator=${CAMPO_PESQUISA} 
    Input Text    locator=${CAMPO_PESQUISA}      text=${PRODUTO}  

Clicar no botão de Pesquisa
    Wait Until Element Is Visible    locator=${BOTAO_PESQUISA}
    Click Element    locator=${BOTAO_PESQUISA}

O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado   
    Wait Until Element Contains      locator=${PRODUTO_PESQUISA}     text=Console Xbox Series S