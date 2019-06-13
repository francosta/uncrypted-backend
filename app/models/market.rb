class Market < ApplicationRecord
    has_many :currency_markets
    has_many :currencies, through: :currency_markets
end
