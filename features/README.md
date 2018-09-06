# My Store

Para execução dos testes após ter feito do clone do projeto, e possuir o Ruby instalado junto ao DevKit, é necessário  instalar uma gem chamada bundler, que servirá como gerenciador das gems e suas dependências através do arquivo Gemfile.

Para instalar, é necessário rodar o comando

```sh
gem install bundler
```

Agora com o Bundler instalado vamos instalar as dependencias do projeto que estão definidas no arquivo Gemfile, e essa ação deve ser feita através do comando.

```sh
bundle install
```

### Estrutura do projeto

A estrura do projeto está definida no seguinte formato

#### cucumber/features/specifications
> Diretório com o arquivo .feature com o cenário

#### cucumber/features/step_definitions

> Diretório com o arquivo step .rb feature com o cenário

#### cucumber/features/support
> Diretório com o arquivo de configuração .rb onde estão as configurações do projeto, assim com as gems utilizadas

# Execução dos testes

Agora com o ambiente configurado, vamos a execução dos testes, basta navegar até o diretório CUCUMBER, e executar o comando

```sh
cucumber
```

Então os testes serão executados com sucesso.
