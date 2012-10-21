class AddDefaultValueToValueAttribute < ActiveRecord::Migration
  def change
  	change_column :votes, :value, :integer, default: 0
  end
end
