class AddQuantityToCurrencyPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_portfolios, :quantity, :integer
  end
end
