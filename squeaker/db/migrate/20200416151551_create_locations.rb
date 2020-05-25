class CreateLocations < ActiveRecord::Migration[5.2]
  def change
    create_table :locations do |t|
      #how we wanna change the database
      #describe here what table should look like
      t.string :name, null: false
      #null: false means this column is required field 
      
    end
  end
end
