#language: pt

Funcionalidade: Fechar pedido

Contexto:
Dado que eu estou na tela inicial do Luma
E crio novo cadastro
Cenario: Cadastro com Sucesso

@Fecharpedido

Cenario: Fechar pedido com sucesso
Dado que eu adicione um produto ao carrinho
Quando eu prosseguir para o checkout
E preencher formulario de endereco
E finalizo o pedido
Entao a compra devera ser finalizada
