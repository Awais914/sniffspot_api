class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.references :spot, null: false, foreign_key: true
      t.text :content
      t.float :rating

      t.timestamps
    end
  end
end
