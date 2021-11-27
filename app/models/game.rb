class Game < ApplicationRecord
    has_and_belongs_to_many :genres, join_table: "game_genres"
    has_and_belongs_to_many :publishers, join_table: "game_publishers"
    has_and_belongs_to_many :developers, join_table: "game_developers"
    has_many :reviews
    has_many :users, through: :reviews
    has_many :orders
    has_many :users, through: :orders
end
