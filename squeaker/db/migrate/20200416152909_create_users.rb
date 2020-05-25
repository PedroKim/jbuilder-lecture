class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.integer :location_id, null: false

      t.timestamps 
    end

    #we use add_index(indexing) on specific columns for speed-lookup
    #make sure add_index is outide of create_table
    add_index :users, :location_id
    add_index :users, :username, unique: true
  end
end
