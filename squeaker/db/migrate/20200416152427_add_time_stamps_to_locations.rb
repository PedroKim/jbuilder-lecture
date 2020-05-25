class AddTimeStampsToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :created_at, :datetime, null: false
    add_column :locations, :updated_at, :datetime, null: false
  end
end
