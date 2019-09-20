class AddPeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :house_id

      t.timestamps
    end
    add_index :people, :house_id
  end
end
