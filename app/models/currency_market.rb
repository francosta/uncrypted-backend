class CurrencyMarket < ApplicationRecord
  belongs_to :market
  belongs_to :currency
end
