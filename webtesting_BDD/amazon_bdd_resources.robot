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

Dado que estou na home page da Amazon.com.br
    Go To    url=${URL}  

Quando acessar o menu "Eletrônicos"    
    Wait Until Element Is Visible    locator=${MENU_ELETRONICOS}
    Click Element    locator=${MENU_ELETRONICOS}

Então o título da página deve ficar "${TITULO}"
    Title Should Be    title=${TITULO} 

E a categoria "${CATEGORIA}" deve ser exibida na página  
    Wait Until Element Is Visible    locator=${CATEGORIA_COMPUTADORES_INFORMATICA}
    Wait Until Element Contains      locator=${CATEGORIA_COMPUTADORES_INFORMATICA}    text=${CATEGORIA}    

Quando pesquisar pelo produto "${PRODUTO}"   
    Wait Until Element Is Visible    locator=${CAMPO_PESQUISA} 
    Input Text    locator=${CAMPO_PESQUISA}      text=${PRODUTO} 
    Clicar no botão de Pesquisa 

Clicar no botão de Pesquisa
    Wait Until Element Is Visible    locator=${BOTAO_PESQUISA}
    Click Element    locator=${BOTAO_PESQUISA}

 Então um produto da linha "Xbox Series S" deve ser mostrado na página
    Wait Until Element Contains      locator=${PRODUTO_PESQUISA}     text=Console Xbox Series S