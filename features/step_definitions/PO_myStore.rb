
# Mapeamento dos campos dentro do formulario a ser preenchido
class Form <SitePrism::Section
  element :logo, "#header_logo"
  element :blouse, "#homefeatured > li:nth-child(2)"
  element :addCart, "#add_to_cart"
end

class FormAddSucess <SitePrism::Section
  element :addSucess, ".clearfix"
  element :checkout, "a.btn.btn-default.button.button-medium"
end

class FormCart <SitePrism::Section
  element :cartTitle, "#cart_title"
  element :products, ".product-name"
  element :price, "#total_price"
  element :continueShopping, "a.button.btn.btn-default.standard-checkout.button-medium"
end

class FormCreateUser <SitePrism::Section
  element :email, "#email_create"
  element :createButton, "#SubmitCreate"
end

class FormUserDate <SitePrism::Section
  element :email, "#email_create"
  element :genderMasc, "#uniform-id_gender1"
  element :firstName, "#customer_firstname"
  element :lastName, "#customer_lastname"
  element :email, "#email"
  element :password, "#passwd"
  element :bDay, "#uniform-days"
  element :bMonth, "#uniform-months"
  element :bYear, "#uniform-years"
  element :saveUser, "#submitAccount"
end

class FormAdressData <SitePrism::Section
  element :firstName, "#firstname"
  element :lastName, "#lastname"
  element :adress, "#address1"
  element :city, "#city"
  element :state, "#uniform-id_state"
  element :postalCode, "#postcode"
  element :country, "#uniform-id_country"
  element :adtInformation, "#other"
  element :phone_mobile, "#phone_mobile"
  element :adressName, "#alias"
end

class FormValidAdress <SitePrism::Section
  element :adress, "#address_delivery"
  element :buttonValidAdress, ".button.btn.btn-default.button-medium"
end

class FormTermsOfService <SitePrism::Section
  element :termOfService, "#uniform-cgv"
  element :processCarrier, ".button.btn.btn-default.standard-checkout.button-medium"
end

class FormPayment <SitePrism::Section
  element :totalPrice, "#total_price"
  element :bankwire, "a.bankwire"
  element :confirmPayment, ".button.btn.btn-default.button-medium"
end

class FormOrderConfirmation <SitePrism::Section
  element :priceOrderConfirmation, ".price"
end


# Mapeamento dos forms
class Main < SitePrism::Page
    section :form, Form, "div#page"
    section :formAddSucess, FormAddSucess, "#layer_cart"
    section :formCart, FormCart, "#page > div.columns-container"
    section :formCreateUser, FormCreateUser, "form#create-account_form.box"
    section :formUserDate, FormUserDate, "form#account-creation_form"
    section :formAdressData, FormAdressData, "#account-creation_form > div:nth-child(2)"
    section :formValidAdress, FormValidAdress, "#center_column"
    section :formTermsOfService, FormTermsOfService, "#carrier_area"
    section :formPayment, FormPayment, "#center_column"
    section :formOrderConfirmation, FormOrderConfirmation, ".box"
end
