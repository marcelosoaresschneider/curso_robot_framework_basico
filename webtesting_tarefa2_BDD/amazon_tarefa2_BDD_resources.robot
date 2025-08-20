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

Dado que estou na home page da Amazon.com.br
    Go To    url=${URL}    

Quando pesquisar pelo produto "${PRODUTO}" 
    Wait Until Element Is Visible    locator=${CAMPO_PESQUISA} 
    Input Text    locator=${CAMPO_PESQUISA}      text=${PRODUTO} 
    Clicar no botão de Pesquisa 

Clicar no botão de Pesquisa
    Wait Until Element Is Visible    locator=${BOTAO_PESQUISA}
    Click Element    locator=${BOTAO_PESQUISA}

 Então um produto da linha "Xbox Series S" deve ser mostrado na página
    Wait Until Element Contains      locator=${PRODUTO_PESQUISA}     text=Console Xbox Series S    

E adiciono o produto "Console Xbox Series S" no carrinho
    Wait Until Element Is Visible    locator=${PRODUTO_PESQUISA}
    Click Element    locator=${PRODUTO_PESQUISA}  
    Wait Until Element Is Visible    locator=${BOTAO_ADICIONAR_CARRINHO}
    Click Button    locator=${BOTAO_ADICIONAR_CARRINHO}
    Sleep    3s
    Click Button    locator=${BOTAO_SEM_PROTECAO}
    
E verifico se o produto "Console Xbox Series S" foi adicionado com sucesso 
    Sleep    8s
    Wait Until Element Is Visible    locator=${TEXTO_ADICIONADO_COM_SUCESSO}
    Element Text Should Be    locator=${TEXTO_ADICIONADO_COM_SUCESSO}    expected=Adicionado ao carrinho

Então removo o produto "Console Xbox Series S" do carrinho
    Click Button    locator=${BOTAO_IR_CARRINHO DE COMPRAS}
    Element Text Should Be    locator=${TITULO_CARRINHO DE COMPRAS}    expected=Carrinho de compras
    Sleep    3s
    Click Button    locator=${BOTÃO_LIXEIRA} 
    Sleep    3s
    Element Text Should Be    locator=${TEXTO_PRODUTO_REMOVIDO}    expected=Console Xbox Series S foi removido de Carrinho de compras. 

E Verifico se o carrinho fica vazio
    Element Text Should Be    locator=${TEXTO_SUBTOTAL}    expected=Subtotal (0 produtos):
        
