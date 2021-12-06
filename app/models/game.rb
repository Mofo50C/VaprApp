class Game < ApplicationRecord
    has_and_belongs_to_many :genres, join_table: "game_genres"
    has_and_belongs_to_many :publishers, join_table: "game_publishers"
    has_and_belongs_to_many :developers, join_table: "game_developers"
    has_and_belongs_to_many :carts, join_table: "cart_items"
    has_many :orders
    has_many :users, through: :orders

    def calculate_price
        price * (100 - discount) / 100
    end

end
