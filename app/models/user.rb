class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :games, through: :reviews
    has_many :orders
    has_many :games, through: :orders
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
