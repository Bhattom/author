class CreateLineitems < ActiveRecord::Migration[7.1]
  def change
    create_table :lineitems do |t|
      t.integer :quantity
      t.references :book, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
