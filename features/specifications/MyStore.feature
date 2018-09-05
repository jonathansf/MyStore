#language: pt
#encoding: utf-8

@MyStore
Funcionalidade: Realizar compra no site
  Como usuario
  Eu quero realizar uma compra no site


@Data
Cenário: Novo usuario realizando compra
  Dado que eu acesse o site
  Quando seleciono o produto desejado
  E avanco para o checkout
  E valido o produto adicionado no checkout
  E cadastro o usuario
  E preencho os dados do usuario
  E preencho os endereco do usuario
  E valido o endereco
  E aceito os termos de servico
  E valido o valor total da compra
  E escolho a forma de pagamento
  Entao a compra e realizada com sucesso
