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
${BOTAO_ADICIONAR_CARRINHO}    //*[@id="add-to-cart-button"]   
${BOTAO_SEM_PROTECAO}    //*[@id="attachSiNoCoverage"]/span/input
${TEXTO_ADICIONADO_COM_SUCESSO}    (//h4[@class='a-alert-heading'][normalize-space()='Adicionado ao carrinho'])[2]
${TEXTO_SUBTOTAL}    //*[@id="sc-subtotal-label-activecart"]
${TEXTO_PRODUTO_REMOVIDO}    (//div[@class='sc-list-item-removed-msg-delete a-padding-medium'])[1]
${BOTÃO_LIXEIRA}    (//button[@aria-label='Excluir Console Xbox Series S'])[1]
${TITULO_CARRINHO DE COMPRAS}    //*[@id="sc-active-items-header"]
${BOTAO_IR_CARRINHO DE COMPRAS}    (//input[@aria-labelledby='attach-sidesheet-view-cart-button-announce'])[1]



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

Verificar o resultado da pesquisa se está listando o produto "Console Xbox Series S"
    O sistema deve exibir a tela com o resultado da pesquisa, listando o produto pesquisado

Adicionar o produto "Console Xbox Series S" no carrinho
    Wait Until Element Is Visible    locator=${PRODUTO_PESQUISA}
    Click Element    locator=${PRODUTO_PESQUISA}  
    Wait Until Element Is Visible    locator=${BOTAO_ADICIONAR_CARRINHO}
    Click Button    locator=${BOTAO_ADICIONAR_CARRINHO}
    Sleep    3s
    Click Button    locator=${BOTAO_SEM_PROTECAO}
    
Verificar se o produto "Console Xbox Series S" foi adicionado com sucesso  
    Sleep    8s
    Wait Until Element Is Visible    locator=${TEXTO_ADICIONADO_COM_SUCESSO}
    Element Text Should Be    locator=${TEXTO_ADICIONADO_COM_SUCESSO}    expected=Adicionado ao carrinho

Remover o produto "Console Xbox Series S" do carrinho
    Click Button    locator=${BOTAO_IR_CARRINHO DE COMPRAS}
    Element Text Should Be    locator=${TITULO_CARRINHO DE COMPRAS}    expected=Carrinho de compras
    Sleep    3s
    Click Button    locator=${BOTÃO_LIXEIRA} 
    Sleep    3s
    Element Text Should Be    locator=${TEXTO_PRODUTO_REMOVIDO}    expected=Console Xbox Series S foi removido de Carrinho de compras. 

Verificar se o carrinho fica vazio
    Element Text Should Be    locator=${TEXTO_SUBTOTAL}    expected=Subtotal (0 produtos):
        
