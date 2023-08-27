Dado('que realize um novo cadastro') do
    steps %{
        Dado que iniciei um novo cadastro
        Quando preencher as informações 
        E registrar
        Então cadastro deve ser confirmado
    }
end
  
Dado('selecionar a opção de logar') do
    @login = Login.new
    @login.direcionar_login
end

Quando('preencher login com cadastro recém criado') do
    @login.credenciais('cadastro_novo')
end

Quando('realizar o login') do
    @login.efetuar_login
end

Então('devo estar na home da aplicação') do
    @login.home_aplicacao
end

Quando('preencher login com credenciais {string}') do |string|
    @login = Login.new
    @login.credenciais(string)
end
  
Então('deve retornar erro no login') do
    @login.login_invalido_msg
end