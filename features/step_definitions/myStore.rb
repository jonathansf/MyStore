Dado("que eu acesse o site") do
  # Esta com a "/" pois referencia o app_host do env.rb
  visit '/'
end

Entao("o logo e apresentado") do
  expect(page).to have_css("#header_logo")
  puts 'Acessou o site!!!'
end


Entao("seleciono o produto desejado") do
  expect(@Page).to have_content("Blouse")
  @Page.form.blouse.click
  expect(@Page).to have_css("#add_to_cart")
  @Page.form.addCart.click
  expect(@Page.formAddSucess.addSucess).to have_content("Product successfully added to your shopping cart")
  puts 'Selecionou o produto desejado'
end

Entao("avanco para o checkout") do
  expect(@Page.formAddSucess.checkout).to have_content("Proceed to checkout")
  @Page.formAddSucess.checkout.click
  puts 'Foi para checkout'
end

E("que eu esteja no checkout") do
    expect(@Page.formCart.cartTitle).to have_content("SHOPPING-CART SUMMARY")
    puts 'Esta na pagina do checkout'
end

E("valido o produto adicionado") do
    expect(@Page.formCart.products).to have_content("Blouse")
    @price = @Page.formCart.price.text
    puts @price
    puts 'O produto correto esta no carrinho'
end

E("prossigo com a compra") do
    expect(@Page.formCart.continueShopping).to have_content("Proceed to checkout")
    @Page.formCart.continueShopping.click
    puts 'Clicou no continuar com a compra'
end

E("cadastro o usuario") do
    expect(@Page.formCreateUser).to have_content("CREATE AN ACCOUNT")
    @Page.formCreateUser.email.set(@email)
    @Page.formCreateUser.createButton.click
    puts 'Inputou o email do usuario'
end

E("preencho os dados do usuario") do
    expect(@Page.formUserDate).to have_content("YOUR PERSONAL INFORMATION")
    @Page.formUserDate.genderMasc.click
    @Page.formUserDate.firstName.set(@firstName)
    @Page.formUserDate.lastName.set(@lastName)
    @Page.formUserDate.email.set(@email)
    @Page.formUserDate.password.set(@password)
    @Page.formUserDate.bDay.select(@bDay)
    @Page.formUserDate.bMonth.select(@bMonth)
    @Page.formUserDate.bYear.select(@bYear)
    puts 'preencheu as informacoes do usuario'
end


E("preencho os endereco do usuario") do
    expect(@Page.formAdressData).to have_content("YOUR ADDRESS")
    @Page.formAdressData.firstName.set(@firstName)
    @Page.formAdressData.lastName.set(@lastName)
    @Page.formAdressData.adress.set(@adress)
    @Page.formAdressData.city.set(@city)
    @Page.formAdressData.state.select(@state)
    @Page.formAdressData.postalCode.set(@postalCode)
    @Page.formAdressData.country.select(@country)
    @Page.formAdressData.adtInformation.set(@adtInformation)
    @Page.formAdressData.phone_mobile.set(@phone_mobile)
    @Page.formAdressData.adressName.set(@adressName)
    @Page.formUserDate.saveUser.click
    puts 'preencheu as informacoes do endereco'
end

E("valido o endereco") do
    expect(@Page.formValidAdress).to have_content(@adress)
    @Page.formValidAdress.buttonValidAdress.click
    puts 'Validou o endereço'
end


E("aceito os termos de servico") do
    expect(@Page.formTermsOfService).to have_content("Terms of service")
    @Page.formTermsOfService.termOfService.click
    @Page.formTermsOfService.processCarrier.click
    puts 'Aceitou termos de servicos'
end

E("valido o preco") do
    expect(@Page.formPayment).to have_content("PLEASE CHOOSE YOUR PAYMENT METHOD")
    @totalPrice = @Page.formPayment.totalPrice.text
    expect(@Page.formPayment.totalPrice).to have_content(@price)
    puts 'validou o preço'
end

E("escolho a forma de pagemento") do
    expect(@Page.formPayment.bankwire).to have_content("Pay by bank wire")
    @Page.formPayment.bankwire.click
    expect(@Page.formPayment).to have_content("BANK-WIRE PAYMENT.")
    @Page.formPayment.confirmPayment.click
    puts 'pagamento realizado'
end

Entao("a compra e realizada com sucesso") do
  expect(@Page.formOrderConfirmation).to have_content("Your order on My Store is complete.")
  puts 'Validou pedido realizado'
  @priceOrderConfirmation = @Page.formOrderConfirmation.priceOrderConfirmation.text
  expect(@Page.formOrderConfirmation.priceOrderConfirmation).to have_content(@price)
  expect(@Page.formOrderConfirmation.priceOrderConfirmation).to have_content(@totalPrice)
  puts 'Validou o preço identico ao carrinho e da tela de pagamento'
end









E("preencho as informacoes cadastrais") do
  @Page.form.nome.set(@nome)
  @Page.form.email.set(@email)
  @Page.form.telefone.set(@telefone)
  @Page.form.celular.set(@celular)
  @Page.form.cidade.set(@cidade)
  @Page.form.estado.set(@estado)
  @Page.form.mensagem.set(@mensagem)
  puts 'Os campos foram preenchidos com sucesso!!!'
  puts 'Não foi enviado o formulario para não sujar a base de dados!!!'
  sleep 30
end
