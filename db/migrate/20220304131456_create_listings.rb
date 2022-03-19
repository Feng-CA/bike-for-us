class CreateListings < ActiveRecord::Migration[6.1]
  def change
    create_table :listings do |t|
      t.string :title
      t.integer :price
      t.boolean :sold, default: false
      t.text :description
      t.string :suburb
      t.references :state, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true
      t.references :gender, null: false, foreign_key: true

      t.timestamps
    end
  end
end
