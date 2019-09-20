class AddHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.text :address

      t.timestamps
    end
  end
end
