class AddTransactionTotalToCurrencyPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :currency_portfolios, :transaction_total, :float
  end
end
