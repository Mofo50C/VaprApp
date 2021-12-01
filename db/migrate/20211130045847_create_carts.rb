class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|

      t.timestamps
    end

    create_table :cart_items, id: false do |t|
      t.belongs_to :cart
      t.belongs_to :game
    end
  end
end
