# rd_challenge

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/DarlingL/rd_challenge/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/DarlingL/rd_challenge/tree/main)

## Para Iniciar ##


### Instalar o bundler ###
Na raiz do projeto execute:
```shell
gem install bundler
```

### Instalar Gems Necessárias dos dois projetos (web e mobile)  ###
Na raiz do projeto execute:
```shell
bundle install
```

## Executando ##

### Rodar a Automação Web ###
Dentro do diretório `rd_challenge/Web` execute:
```shell
cucumber 
```
Para uma execução com report, execute:
```shell
cucumber --publish
```

Execução atual está para o modo headless !
Para voltar ao modo comum, altere o driver do Capybara no arquivo 'Web/features/support/env.rb' substitua por isso:

```shell
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
  :browser => :chrome
)
end
```

### Obs: Automação Web ###
Browser utilizado no teste é o chrome, necessário instalar chromeDriver compatível com a versão local do chrome e seu sistema operacional! [Link de Apoio](https://chromedriver.chromium.org/downloads)


______________________________________________________________________________________________________

### Rodar a Automação Mobile ###
Dentro do diretório `rd_challenge/Mobile` execute:
```shell
cucumber -p android -t @android
```
Para uma execução com report, execute:
```shell
cucumber -p android_report -t @android
```

Report fica disponivel na pasta:
```shell
    rd_challenge/Mobile/reports
```
