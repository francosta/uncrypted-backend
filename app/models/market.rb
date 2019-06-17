class Market < ApplicationRecord
    has_many :currency_markets, dependent: :destroy
    has_many :currencies, through: :currency_markets
end
