class AddCurrencyToPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :currency, :string
  end
end
