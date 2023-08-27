require_relative 'cadastro_screen'

class Login < BaseScreen

    def initialize
        @login_opt = 'btnGotoLogin'
        @email_campo = 'etLogGmail'
        @password_campo = 'etLoginPassword'
        @login_btn = 'btnLogin'
        @area_logada_text = 'You are now logged in'
        @login_error_texto = "//android.widget.Toast[contains(@text, 'Login error')]"    
    end

    def direcionar_login
        wait_for_element(:id, @login_opt)
        id(@login_opt).click
    end

    def preencher_credenciais(email, password)
        wait_for_element(:id, @email_campo)
        id(@email_campo).send_keys(email)
        id(@password_campo).send_keys(password)
    end

    def efetuar_login
        id(@login_btn).click
    end
    
    def home_aplicacao
        text(@area_logada_text).displayed?
    end

    def credenciais(tipo_credencial)
        case tipo_credencial
        when 'inválidas'
            @user = CREDENTIALS['inválidas'.to_sym]
            preencher_credenciais(@user[:email], @user[:password])
        when 'válidas'
            @user = CREDENTIALS['válidas'.to_sym]
            preencher_credenciais(@user[:email], @user[:password])
        when 'cadastro_novo'
            email_novo = Cadastro.cadastro_novo_email
            password_novo = Cadastro.cadastro_novo_password
            preencher_credenciais(email_novo, password_novo)
        else
            puts ('Opção não reconhecida')
        end

    end

    def login_invalido_msg
        wait = Selenium::WebDriver::Wait.new(timeout: 5)
        wait.until { find_element(xpath: @login_error_texto) }
        puts "Login com erro - OK "
            rescue Selenium::WebDriver::Error::TimeOutError
        puts "Cenário Falhou!"
    end
    
end
