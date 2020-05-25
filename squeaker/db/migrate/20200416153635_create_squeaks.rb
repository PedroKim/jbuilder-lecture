class CreateSqueaks < ActiveRecord::Migration[5.2]
  def change
    create_table :squeaks do |t|
      t.string :body, null: false
      t.integer :author_id, null: false

      t.timestamps
    end
    add_index :squeaks, :author_id
  end
end
