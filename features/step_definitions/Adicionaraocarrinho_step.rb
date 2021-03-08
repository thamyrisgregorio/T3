  
  Dado('que eu acesse o produto desejado') do
    find("#search").set "240-LV05"
    find("#search").native.send_keys(:enter)
  end
  
  Quando('adiciono o produto ao carrinho') do
    click_link_or_button "LifeLong Fitness IV", match: :first
    find("#product-addtocart-button").click
  end
  
  E('acesso a pagina de carrinho de compras') do
    click_link_or_button "shopping cart"
  end
  
  Entao('o produto devera estar no carrinho') do
    expect(page).to have_text "LifeLong Fitness IV"
  end