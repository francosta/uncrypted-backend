class ApplicationController < ActionController::API


    def self.updateAPI
        currency_tickers = ["BTC", "ETH", "LTC", "DASH", "XRP"]
        api = API.new
        currency_tickers.each do |ticker|
            raw_data = api.get_currency_data(ticker)
            currency = Currency.find_by(ticker: ticker)
            currency.update(ticker: raw_data["ticker"]["base"], target: raw_data["ticker"]["target"], price: raw_data["ticker"]["price"], volume: raw_data["ticker"]["volume"], change: raw_data["ticker"]["change"])
            
            raw_data["ticker"]["markets"].each do |market|
                marketToEdit = Market.find_by(name: market["market"])
                currency_market = CurrencyMarket.find_by(market_id: marketToEdit.id, currency_id: currency.id)
                currency_market.update(market_id: marketToEdit.id, currency_id: currency.id, price: market["price"], volume: market["volume"])
            end
       
        end 
    end

    Thread.new do
        loop do 
          sleep 30
          self.updateAPI()
        end
    end

    def current_user
        id = decode_token["id"]
        User.find_by(id: id)
    end

    def token
        request.headers["Authorisation"]
    end

    def decode_token
        begin
            JWT.decode(token, secret).first
        rescue 
            {}
        end
    end

    def issue_token(data)
        JWT.encode(data, secret)
    end

    def secret
        'shh'
    end

end