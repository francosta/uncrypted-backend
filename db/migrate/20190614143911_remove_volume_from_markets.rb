class RemoveVolumeFromMarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :volume, :float
  end
end
