class AddDefaultValueToGdsAvailable < ActiveRecord::Migration
  def up
    change_column :gds, :available, :boolean, :default => true
  end

  def down
    change_column :gds, :available, :boolean, :default => nil
  end
end
