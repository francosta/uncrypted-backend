require 'json'
require 'rest-client'

class API

 def get_currency_data(ticker)
   response = RestClient.get("https://api.cryptonator.com/api/full/#{ticker}-usd")
   hash = JSON.parse(response)
 end

end