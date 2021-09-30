class CreateCats < ActiveRecord::Migration[6.1]
  def change
    create_table :cats do |t|
      t.string :name
      t.integer :age
      t.string :cat_url
      t.integer :food_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
