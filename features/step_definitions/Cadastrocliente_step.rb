Dado('que eu estou na tela inicial do Luma') do
    visit("https://magento.nublue.co.uk/")
  end
  
  Dado('que eu acesso a tela de cadastro de nova conta') do
   @cadastrocliente.acessar_formulario_cadastro
  end
  
  Quando('e preenchido todos os campos obrigatorios') do
    @cadastrocliente.preencher_formulario
  end
  
  Quando('aciono o botão criar nova conta') do
    @cadastrocliente.salvar_cadastro
  end
  
  Entao('a mensagem conta criada com sucesso devera ser exibida') do
    @paineldousuario.validar_cadastro_efetuado
  end