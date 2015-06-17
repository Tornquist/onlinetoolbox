class AddInventoryToRibbons < ActiveRecord::Migration
  def change
    add_column :ribbons, :inventory, :integer
  end
end
