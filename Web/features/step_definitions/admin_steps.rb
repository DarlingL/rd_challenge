Quando('selecionar a opção Admin') do
  @admin = Admin.new
  @admin.acessar_menu_admin
  end
  
  Quando('realizar o cadastro de um novo Admin') do
    @admin.cadastro_novo_admin
  end
  
  Então('novo Admin deve ser criado') do
    @admin.msg_admin_criado
  end