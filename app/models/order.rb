class Order < ApplicationRecord
    belongs_to :user
    belongs_to :game
    validates :user_id, :game_id, :total, presence: true
end