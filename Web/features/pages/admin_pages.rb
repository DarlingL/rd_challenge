class Admin < SitePrism::Page
  
  # elementos mapeados aqui é possivel criar de diversas formas os identificadores, usando o site_prism, criando variavel e recebendo por parametro também 
  element :menu_admin_btn, '#app > div.oxd-layout > div.oxd-layout-navigation > aside > nav > div.oxd-sidepanel-body > ul > li:nth-child(1) > a'
  element :add_admin_btn, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div.orangehrm-paper-container > div.orangehrm-header-container > button'
  element :save_admin_btn, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div.oxd-form-actions > button.oxd-button.oxd-button--medium.oxd-button--secondary.orangehrm-left-space'
  element :expandir_role, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div:nth-child(1) > div > div:nth-child(1) > div > div:nth-child(2) > div'
  element :employee_name, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div:nth-child(1) > div > div:nth-child(2) > div > div:nth-child(2) > div > div > input' 
  element :expandir_status, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div:nth-child(1) > div > div:nth-child(3) > div > div:nth-child(2) > div > div'
  element :username_opt, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div:nth-child(1) > div > div:nth-child(4) > div > div:nth-child(2) > input'
  element :password_opt, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div.oxd-form-row.user-password-row > div > div.oxd-grid-item.oxd-grid-item--gutters.user-password-cell > div > div:nth-child(2) > input'
  element :password_opt_confirm, '#app > div.oxd-layout > div.oxd-layout-container > div.oxd-layout-context > div > div > form > div.oxd-form-row.user-password-row > div > div:nth-child(2) > div > div:nth-child(2) > input'
  element :msg_sucesso_cadastro, 'Sucessfully Saved'
  element :toast, '.oxd-text.oxd-text--p.oxd-text--toast-title.oxd-toast-content-text'
 
 
  # metodos usados referentes ao login
  def acessar_menu_admin
    menu_admin_btn.click
  end

  def role_info
    expandir_role.click
    Capybara.current_session.driver.browser.action.send_keys(:arrow_down).perform
    Capybara.current_session.driver.browser.action.send_keys(:enter).perform
  end

  def employee_info
    employee_name.click
    name = "A"
    employee_name.set name
    sleep 4
    Capybara.current_session.driver.browser.action.send_keys(:arrow_down).perform
    Capybara.current_session.driver.browser.action.send_keys(:enter).perform
  end

  def status_info
    expandir_status.click
    Capybara.current_session.driver.browser.action.send_keys(:arrow_down).perform
    Capybara.current_session.driver.browser.action.send_keys(:enter).perform
  end

  def inserir_admin_infos
    role_info
    employee_info
    status_info
  end

  def username_info
    @username = Faker::Internet.username(specifier: 8)
    username_opt.set @username
  end

  def password_info
    @senha = Faker::Internet.password 
    password_opt.set @senha 
    password_opt_confirm.set @senha 
  end

  def inserir_admin_credenciais
    username_info
    password_info
  end

  def cadastro_novo_admin
    add_admin_btn.click
    inserir_admin_infos
    inserir_admin_credenciais
    save_admin_btn.click
  end

  def msg_admin_criado
      texto_retorno = toast.text
      raise 'Admin não foi cadastrado' unless texto_retorno.eql? 'Success'
  end
    
end
