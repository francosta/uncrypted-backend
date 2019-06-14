class AddVolumeToCurrencyMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_markets, :volume, :float
  end
end
