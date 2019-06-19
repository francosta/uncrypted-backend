class AddPriceToCurrencyPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_portfolios, :price, :float
  end
end
