# rd_challenge

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
