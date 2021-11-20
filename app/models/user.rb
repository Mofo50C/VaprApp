class User < ApplicationRecord
    has_and_belongs_to_many :games, join_table: "user_games"
    has_many :reviews
    has_many :games, through: :reviews
    has_many :orders
    has_many :games, through: :orders
end
