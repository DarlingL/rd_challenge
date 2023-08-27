# encoding: utf-8
# language: pt  


Funcionalidade: Desafio
Realizar os cenários do Desafio


Contexto:
Dado estar na tela inicial da aplicação


Cenário: Realizar Login com Sucesso
Quando inserir credenciais "válido"
E realizar Login
Então deve exibir a home da aplicação

Cenário: Cadastrar novo Admin
Dado que esteja logado
Quando selecionar a opção Admin
E realizar o cadastro de um novo Admin
Então novo Admin deve ser criado