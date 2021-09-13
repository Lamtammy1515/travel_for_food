class CreateReview < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title 
      t.string :review 
      t.string :image 
      t.integer :user_id 
      t.decimal :star_rating 
      t.integer :location_id 

      t.timestamps
    end
  end
end
