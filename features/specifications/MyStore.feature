#language: pt
#encoding: utf-8

@MyStore
Funcionalidade: Realizar compra no site
  Como usuario
  Eu quero realizar uma compra no site


@Dados
@acessarSite
Cenário: Acessando o site
  Dado que eu acesse o site
  Entao o logo e apresentado

@Dados
@comprar
Cenário: Selecionar produto
  Dado que eu acesse o site
  Entao seleciono o produto desejado
  E avanco para o checkout
  E que eu esteja no checkout
  E valido o produto adicionado
  E prossigo com a compra
  E cadastro o usuario
  E preencho os dados do usuario
  E preencho os endereco do usuario
  E valido o endereco
  E aceito os termos de servico
  E valido o preco
  E escolho a forma de pagemento
  Entao a compra e realizada com sucesso
