class Cart < ApplicationRecord
    has_and_belongs_to_many :games, join_table: "cart_items"
end