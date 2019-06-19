class AddQuantityToPortfolio < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolios, :quantity, :integer
  end
end
