# Instanciando os PageObjects
Before '@MyStore' do
  @Page = Main.new
end

# Criando a massa de dados, para ser usado nos steps
Before '@Data' do
   @firstName = Faker::Name.first_name
   @lastName = Faker::Name.last_name
   @email = Faker::Internet.email
   @password = '#123abc'
   @bDay = '10'
   @bMonth = 'December'
   @bYear = '1993'

   @adress = Faker::Address.street_name
   @city = Faker::Address.city
   @state = 'Florida'
   @postalCode = '12345'
   @country = 'United States'
   @adtInformation = Faker::Address.community
   @phone_mobile = Faker::PhoneNumber.cell_phone
   @adressName = 'My Adrress'
end
