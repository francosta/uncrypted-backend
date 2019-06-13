class CreateCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :currencies do |t|
      t.string :ticker
      t.string :target
      t.string :price
      t.string :volume
      t.string :change

      t.timestamps
    end
  end
end
