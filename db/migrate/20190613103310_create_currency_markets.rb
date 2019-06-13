class CreateCurrencyMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_markets do |t|
      t.references :market, foreign_key: true
      t.references :currency, foreign_key: true

      t.timestamps
    end
  end
end
