#language: pt

Funcionalidade: Cadastro Cliente

Contexto: 
Dado que eu estou na tela inicial do Luma


@cadastrocomsucesso

Cenario: Cadastro com Sucesso
Dado que eu acesso a tela de cadastro de nova conta
Quando e preenchido todos os campos obrigatorios
E aciono o botão criar nova conta
Entao a mensagem conta criada com sucesso devera ser exibida


@cadastroinvalido

Cenario: Cadastro invalido
Dado que eu acesso a tela de cadastro de nova conta
Quando não preencho todos os campos obrigatorios
E aciono o botão criar nova conta
Entao a mensagem de campos obrigatorios devera ser exibida

