Dado('crio novo cadastro') do
    steps %{
        Dado que eu acesso a tela de cadastro de nova conta
        Quando e preenchido todos os campos obrigatorios
        Quando aciono o botão criar nova conta
        Entao a mensagem conta criada com sucesso devera ser exibida
    }
  end
  
  Dado('que eu adicione um produto ao carrinho') do
    steps %{
        Dado que eu acesse o produto desejado
        Quando adiciono o produto ao carrinho
        E acesso a pagina de carrinho de compras
        Entao o produto devera estar no carrinho
    }
  end
  
  Quando('eu prosseguir para o checkout') do
    click_link_or_button "Proceed to Checkout"
  end
  
  E('preencher formulario de endereco') do
    find("input[name='street[0]']").set Faker::Address.street_address
    find("input[name='city']").set Faker::Address.city
    find("input[name='postcode']").set Faker::Address.zip_code
    find("select[name='region_id'] option[value='19']").click
    find("input[name='telephone']").set Faker::PhoneNumber.phone_number_with_country_code
    
  end
  
  E('finalizo o pedido') do
    click_link_or_button "Update"
    assert_no_selector(".loader")
    click_link_or_button "Place Order"
  end
  
  Entao('a compra devera ser finalizada') do
    expect(page).to have_text "Your order number is"
    puts find(".order-number").text
  end