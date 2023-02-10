class AddValidationToSpotImages < ActiveRecord::Migration[7.0]
  def change
    change_column :images, :link, :string, null: false, default: ''
  end
end
