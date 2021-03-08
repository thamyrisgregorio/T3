Quando('não preencho todos os campos obrigatorios') do
   @cadastrocliente.preencher_formulario
   @cadastrocliente.limpar_firstname
end

Entao('a mensagem de campos obrigatorios devera ser exibida') do
    @cadastrocliente.alerta_de_campos_obrigatorios
end