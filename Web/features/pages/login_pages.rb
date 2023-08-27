class Login < SitePrism::Page
  
  # elementos mapeados aqui é possivel criar de diversas formas os identificadores, usando o site_prism, criando variavel e recebendo por parametro também 
  element :user_campo, 'input[name="username"]'
  element :password_campo, 'input[name="password"]' 
  element :login_bnt, '#app > div.orangehrm-login-layout > div > div.orangehrm-login-container > div > div.orangehrm-login-slot > div.orangehrm-login-form > form > div.oxd-form-actions.orangehrm-login-action'
  @@menu = ".oxd-navbar-nav"
  @@time_at_work = ".oxd-grid-item oxd-grid-item--gutters orangehrm-dashboard-widget"


  # metodos usados referentes ao login
  
  def inserir_credenciais(user, password)
    user_campo.set user
    password_campo.set password
  end

  def credenciais(string)
    case string
    when "válido"
      @user = CREDENTIALS['válido'.to_sym]
      inserir_credenciais(@user[:user], @user[:password])
    else 
      puts ('tipo de Credencial não Encontrada')
    end 
  end

  def realizar_login
    login_bnt.click
  end

  def home_logado
    page.has_css?(@@menu)
    page.has_css?(@@time_at_work)
  end
    
end