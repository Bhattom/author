class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.string :email
      t.string :name
      t.string :password

      t.timestamps
    end
  end
end
