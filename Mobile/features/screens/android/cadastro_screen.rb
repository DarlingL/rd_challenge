
class Cadastro < BaseScreen

    def initialize
        @inicial_texto = 'Login'
        @cadastro_sucesso_texto = "//android.widget.Toast[contains(@text, 'Registration Successful')]"
        @registro_btn = 'tvRegister'
        @registrar_btn = 'btnRegLogin'
        @name_campo = 'etRegName'
        @phone_campo = 'etRegPhone'
        @email_campo = 'etRegGmail'
        @password_campo = 'etRegPassword'
    end
    
    def tela_inicial
        text(@inicial_texto).displayed?
    end

    def selecionar_cadastro
        wait_for_element(:id, @registro_btn)
        id(@registro_btn).click
    end

    def cadastro_infos
        @name = Faker::Name.name 
        @phone = Faker::PhoneNumber.cell_phone
        wait_for_element(:id, @name_campo)
        id(@name_campo).send_keys(@name)
        id(@phone_campo).send_keys(@phone)
    end 

    def cadastro_credenciais
        @@email = Faker::Internet.email 
        @@password = Faker::Internet.password
        id(@email_campo).send_keys(@@email)
        id(@password_campo).send_keys(@@password)
    end

    def self.cadastro_novo_email
        @@email    
    end

    def self.cadastro_novo_password
        @@password
    end

    def preencher_cadastro
        cadastro_infos
        cadastro_credenciais
    end

    def efetuar_cadastro
        id(@registrar_btn).click
    end

    def validar_cadastro
        wait = Selenium::WebDriver::Wait.new(timeout: 5)
        wait.until { find_element(xpath: @cadastro_sucesso_texto) }
        puts "Cadastro com sucesso!"
            rescue Selenium::WebDriver::Error::TimeOutError
        puts "Cadastro Falhou!"
    end
    
end
