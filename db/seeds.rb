# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require "./lib/api.rb"

User.delete_all
Currency.delete_all
Market.delete_all
Portfolio.delete_all
CurrencyMarket.delete_all
CurrencyPortfolio.delete_all

10.times do 
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Lorem.characters(10), profile_picture: Faker::LoremFlickr.image("200x200"))
end

User.all.each do |u|
    3.times do
        Portfolio.create(risk_profile: Faker::Number.within(1..10), user_id: u.id)
    end
end

User.create(name: "Francisco Costa", email: "francisco@fcosta.pt", password: "password", profile_picture: Faker::LoremFlickr.image("200x200"))

currency_tickers = ["BTC", "ETH", "LTC"]

api = API.new
currency_tickers.each do |ticker|
    raw_data = api.get_currency_data(ticker)

    currency = Currency.create(ticker: raw_data["ticker"]["base"], target: raw_data["ticker"]["target"], price: raw_data["ticker"]["price"], volume: raw_data["ticker"]["volume"], change: raw_data["ticker"]["change"])
    
    raw_data["ticker"]["markets"].each do |market|
        created_market = Market.find_or_create_by(name: market["market"])
        CurrencyMarket.create(market_id: created_market.id, currency_id: currency.id, price: market["price"], volume: market["volume"])
    end
end

50.times do 
    portfolio = Portfolio.all.sample
    currency = Currency.all.sample
    CurrencyPortfolio.create(portfolio_id: portfolio.id, currency_id: currency.id)
end






