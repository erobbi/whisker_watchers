class CreateWeights < ActiveRecord::Migration[6.1]
  def change
    create_table :weights do |t|
      t.decimal :weight, precision: 3, scale: 1
      t.references :cat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
