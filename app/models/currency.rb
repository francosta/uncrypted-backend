class Currency < ApplicationRecord
    has_many :currency_portfolios, dependent: :destroy
    has_many :portfolios, through: :currency_portfolios
    has_many :currency_markets, dependent: :destroy
    has_many :markets, through: :currency_markets
end
