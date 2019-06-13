require 'json'
require 'rest-client'

class API
 physical_currency = "usd"   
 URL = "https://api.cryptonator.com/api/full/#{ticker}-#{physical_currency}"

 def get_currency_data
   response = RestClient.get(URL)
   hash = JSON.parse(response)
 end

end