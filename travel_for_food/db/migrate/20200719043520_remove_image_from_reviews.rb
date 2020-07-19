class RemoveImageFromReviews < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :image, :string
  end
end
