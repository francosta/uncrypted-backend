class CurrencyPortfolio < ApplicationRecord
  belongs_to :portfolio
  belongs_to :currency
end
