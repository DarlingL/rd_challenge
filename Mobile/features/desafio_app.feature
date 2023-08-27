# encoding: utf-8
# language: pt  


Funcionalidade: Desafio
Realizar os cenários do Desafio


Contexto:
Dado estar na tela inicial da aplicação

@android
Cenário: Criar um cadastro
Dado que iniciei um novo cadastro
Quando preencher as informações 
E registrar
Então cadastro deve ser confirmado

@android
Cenário: Realize o login com o novo cadastro e valide se houve sucesso
Dado que realize um novo cadastro
E selecionar a opção de logar
Quando preencher login com cadastro recém criado
E realizar o login 
Então devo estar na home da aplicação

@android
Cenário: Realize o login com um cadastro inexistente e valide o retorno exibido
Quando preencher login com credenciais "inválidas"
E realizar o login 
Então deve retornar erro no login