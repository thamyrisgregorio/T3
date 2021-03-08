class Cadastrocliente
    include Capybara::DSL
    include RSpec::Matchers

    def initialize
       @primeironome = Faker::Name.first_name
       @ultimonome = Faker::Name.last_name
       @email = Faker::Internet.email
       @senha = "Teste123@"
    end

    def acessar_formulario_cadastro 
        click_link_or_button "Create an Account" 
    end

    def preencher_formulario
    find("#firstname").set @primeironome
    find("#lastname").set @ultimonome
    find("#email_address").set @email
    find("#password").set @senha
    find("#password-confirmation").set @senha
    end

    def limpar_firstname
    find("#firstname").set ""
    end

    def salvar_cadastro
    find("button[class='action submit primary']").click
    end

    def alerta_de_campos_obrigatorios
    expect(page).to have_text "This is a required field."
    end

end