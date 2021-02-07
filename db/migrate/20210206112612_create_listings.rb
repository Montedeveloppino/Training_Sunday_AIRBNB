class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.integer :available_beds
      t.integer :price
      t.text :description
      t.boolean :has_wifi
      t.string :welcome_message
      t.boolean :is_booked

      t.timestamps
    end
  end
end
