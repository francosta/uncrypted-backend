class CreateCurrencyPortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_portfolios do |t|
      t.references :portfolio, foreign_key: true
      t.references :currency, foreign_key: true

      t.timestamps
    end
  end
end
