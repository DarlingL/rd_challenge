class BaseScreen
  
    def wait_for_element(type, identificator)
        manage.timeouts.implicit_wait = 10
        @driver.find_element(type, identificator).displayed?
        rescue StandardError
        raise 'Elemento não localizado'
    end

end