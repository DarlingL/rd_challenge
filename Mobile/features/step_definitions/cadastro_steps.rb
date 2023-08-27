Dado('estar na tela inicial da aplicação') do
    @cadastro = Cadastro.new
    @cadastro.tela_inicial
end
  
  Dado('que iniciei um novo cadastro') do
    @cadastro.selecionar_cadastro
  end
  
  Quando('preencher as informações') do
    @cadastro.preencher_cadastro
  end
  
  Quando('registrar') do
    @cadastro.efetuar_cadastro
  end
  
  Então('cadastro deve ser confirmado') do
    @cadastro.validar_cadastro
  end