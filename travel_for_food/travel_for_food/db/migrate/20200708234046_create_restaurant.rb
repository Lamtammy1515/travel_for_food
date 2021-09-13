class CreateRestaurant < ActiveRecord::Migration[6.0]
  def change
    create_table :restaurants do |t|
      t.integer :location_id 
      t.string :name 
    end
  end
end
