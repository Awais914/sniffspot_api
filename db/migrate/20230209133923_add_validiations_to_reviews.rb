class AddValidiationsToReviews < ActiveRecord::Migration[7.0]
  def change
    change_column :reviews, :content, :text, null: false, default: '', length: { minimum: 2, maximum: 200 }
    change_column :spots, :rating, :float, null: false, default: 0.0
  end
end