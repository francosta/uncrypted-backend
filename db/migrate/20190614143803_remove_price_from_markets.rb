class RemovePriceFromMarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :price, :string
  end
end
