class AddValidationsToBook < ActiveRecord::Migration[7.0]
  def change
    change_column :spots, :title, :string, null: false, unique: true, length: { minimum: 10, maximum: 50 }
    change_column :spots, :description, :text, null: false, length: { minimum: 20, maximum: 200 }
    change_column :spots, :price, :float, null: false, default: 0.0
  end
end
