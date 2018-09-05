# 1. Acessar o site: www.automationpractice.com.
Dado("que eu acesse o site") do
  visit '/'
  expect(page).to have_css("#header_logo")
  puts 'Acessou o site!!!'
end

# 2. Escolha um produto qualquer na loja.
# 3. Adicione o produto escolhido ao carrinho.
Quando("seleciono o produto desejado") do
  expect(@Page).to have_content("Blouse")
  @Page.form.blouse.click
  expect(@Page).to have_css("#add_to_cart")
  @Page.form.addCart.click
  expect(@Page.formAddSucess.addSucess).to have_content("Product successfully added to your shopping cart")
  puts 'Selecionou o produto desejado'
end

# 4. Prossiga para o checkout.
E("avanco para o checkout") do
  expect(@Page.formAddSucess.checkout).to have_content("Proceed to checkout")
  @Page.formAddSucess.checkout.click
  puts 'Foi para checkout'
end


# 5. Valide se o produto foi corretamente adicionado ao carrinho e prossiga caso esteja tudo certo.
E("valido o produto adicionado no checkout") do
    expect(@Page.formCart.cartTitle).to have_content("SHOPPING-CART SUMMARY")
    expect(@Page.formCart.products).to have_content("Blouse")
    @price = @Page.formCart.price.text
    expect(@Page.formCart.continueShopping).to have_content("Proceed to checkout")
    @Page.formCart.continueShopping.click
    puts 'O produto correto esta no carrinho, continuar com a compra'
end

# 6. Realize o cadastro do cliente preenchendo todos os campos obrigatórios dos formulários.
E("cadastro o usuario") do
    expect(@Page.formCreateUser).to have_content("CREATE AN ACCOUNT")
    @Page.formCreateUser.email.set(@email)
    @Page.formCreateUser.createButton.click
    puts 'Inputou o email do usuario'
end

# 6. Realize o cadastro do cliente preenchendo todos os campos obrigatórios dos formulários.
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

# 6. Realize o cadastro do cliente preenchendo todos os campos obrigatórios dos formulários.
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

# 7. Valide se o endereço está correto e prossiga.
E("valido o endereco") do
    expect(@Page.formValidAdress).to have_content(@adress)
    @Page.formValidAdress.buttonValidAdress.click
    puts 'Validou o endereço'
end

# 8. Aceite os termos de serviço e prossiga.
E("aceito os termos de servico") do
    expect(@Page.formTermsOfService).to have_content("Terms of service")
    @Page.formTermsOfService.termOfService.click
    @Page.formTermsOfService.processCarrier.click
    puts 'Aceitou termos de servicos'
end

# 9. Valide o valor total da compra.
E("valido o valor total da compra") do
    expect(@Page.formPayment).to have_content("PLEASE CHOOSE YOUR PAYMENT METHOD")
    @totalPrice = @Page.formPayment.totalPrice.text
    expect(@Page.formPayment.totalPrice).to have_content(@price)
    puts 'validou o preço'
end

# 10. Selecione um método de pagamento e prossiga.
E("escolho a forma de pagamento") do
    expect(@Page.formPayment.bankwire).to have_content("Pay by bank wire")
    @Page.formPayment.bankwire.click
    expect(@Page.formPayment).to have_content("BANK-WIRE PAYMENT.")
    @Page.formPayment.confirmPayment.click
    puts 'pagamento realizado'
end

# 11. Confirme a compra e valide se foi finalizada com sucesso.
Entao("a compra e realizada com sucesso") do
  expect(@Page.formOrderConfirmation).to have_content("Your order on My Store is complete.")
  @priceOrderConfirmation = @Page.formOrderConfirmation.priceOrderConfirmation.text
  expect(@Page.formOrderConfirmation.priceOrderConfirmation).to have_content(@price)
  expect(@Page.formOrderConfirmation.priceOrderConfirmation).to have_content(@totalPrice)
  puts 'Validou o preço identico ao carrinho e da tela de pagamento'
end
