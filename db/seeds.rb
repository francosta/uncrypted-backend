# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "./lib/api.rb"

10.times do 
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Lorem.characters(10), profile_picture: Faker::LoremFlickr.image("200x200"))
end

User.all.each do |u|
    3.times do
        Portfolio.create(risk_profile: Faker::Number.within(1..10), user_id: u.id)
    end
end

currency_tickers = ["BTC", "ETH", "LTC"]

api = API.new
currency_tickers.each do |ticker|
    raw_data = api.get_currency_data(ticker)
    Currency.create(ticker: raw_data["ticker"]["base"], target: raw_data["ticker"]["target"], price: raw_data["ticker"]["price"], volume: raw_data["ticker"]["volume"], change: raw_data["ticker"]["change"])
end





