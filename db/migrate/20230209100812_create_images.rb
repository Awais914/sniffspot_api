class CreateImages < ActiveRecord::Migration[7.0]
  def change
    create_table :images do |t|
      t.references :spot, null: false, foreign_key: true
      t.string :link

      t.timestamps
    end
  end
end
