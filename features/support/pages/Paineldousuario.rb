class Paineldousuario
    include Capybara::DSL
    include RSpec::Matchers

    def validar_cadastro_efetuado
    sucesso = find(".message-success").text
    expect(sucesso).to have_text "Thank you for registering with Main Website Store."
    end
    
end