class AddPriceToCurrencyMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_markets, :price, :string
  end
end
