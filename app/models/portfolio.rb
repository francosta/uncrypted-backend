class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :currency_portfolios, dependent: :destroy
  has_many :currencies, through: :currency_portfolios
end
