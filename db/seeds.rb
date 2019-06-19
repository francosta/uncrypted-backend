User.delete_all
Currency.delete_all
Market.delete_all
Portfolio.delete_all
CurrencyMarket.delete_all
CurrencyPortfolio.delete_all

#Create users
10.times do 
    User.create(name: Faker::Name.name, email: Faker::Internet.email, password_digest: Faker::Lorem.characters(10), profile_picture: Faker::LoremFlickr.image("200x200"))
end
User.create(name: "Francisco Costa", email: "francisco@fcosta.pt", password: "password", profile_picture: Faker::LoremFlickr.image("200x200"))

#Get Currencies, Markets and create CurrencyMarkets
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

#Create Portfolios and CurrencyPortfolios

50.times do

    user = User.all.sample
    currency_market = CurrencyMarket.all.sample
    user_portfolios = user.portfolios
    currency_id = currency_market.currency_id
    currency_ticker = Currency.all.select{|currency| currency_id == currency.id}[0].ticker
    buying_price = currency_market.price.to_f
    quantity = Faker::Number.within(1..10)
    transaction_total = buying_price * quantity
    
    if user.portfolios.length == 0
        new_portfolio = Portfolio.create(risk_profile: Faker::Number.within(1..10), user_id: user.id, currency: currency_ticker, quantity: 0)
        CurrencyPortfolio.create(portfolio_id: new_portfolio.id, currency_id: currency_id, price: buying_price, quantity: quantity, transaction_total: transaction_total)
        new_portfolio.update(quantity: quantity)
    else
        currency_portfolios = user_portfolios.map {|portfolio| portfolio.currency_portfolios}.flatten
        user_currencies = currency_portfolios.map {|currency_portfolio| currency_portfolio.currency_id}

        if user_currencies.include?(currency_id)
            portfolio_to_update = user_portfolios.select{|portfolio| portfolio.currency == currency_ticker}[0]
            CurrencyPortfolio.create(portfolio_id: portfolio_to_update.id, currency_id: currency_id, price: buying_price, quantity: quantity, transaction_total: transaction_total)
            portfolio_to_update.update(quantity: portfolio_to_update.quantity + quantity)
        else
            new_portfolio = Portfolio.create(risk_profile: Faker::Number.within(1..10), user_id: user.id, currency: currency_ticker, quantity: 0)
            CurrencyPortfolio.create(portfolio_id: new_portfolio.id, currency_id: currency_id, price: buying_price, quantity: quantity, transaction_total: transaction_total)
            new_portfolio.update(quantity: new_portfolio.quantity + quantity)
        end    
    end

end