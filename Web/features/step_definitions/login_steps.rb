Dado('estar na tela inicial da aplicação') do
    @homepage = Home.new
    @homepage.load
    @login = Login.new
end

Quando('inserir credenciais {string}') do |string|
    @login.credenciais(string)
end
  
  Quando('realizar Login') do
    @login.realizar_login
  end
  
  Então('deve exibir a home da aplicação') do
    @login.home_logado
  end
  
  Dado('que esteja logado') do
    steps %{
      Quando inserir credenciais "válido"
      E realizar Login
      Então deve exibir a home da aplicação
  }
  end
  
  