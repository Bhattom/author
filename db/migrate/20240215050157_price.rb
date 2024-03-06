class Price < ActiveRecord::Migration[7.1]
  def change
    reversible do |direction|
      change_table :authors do |t|
        direction.up   { t.change :price, :integer }
        direction.down { t.change :price, :string }
      end
    end
  end
end
