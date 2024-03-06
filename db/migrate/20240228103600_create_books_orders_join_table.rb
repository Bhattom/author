class CreateBooksOrdersJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :books_orders, id: false do |t|
      t.belongs_to :book
      t.belongs_to :order

      # Add any additional columns or constraints as needed

      t.timestamps
    end
  end
end
