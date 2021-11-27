class User < ApplicationRecord
    has_many :reviews
    has_many :games, through: :reviews
    has_many :orders
    has_many :games, through: :orders
    has_secure_password
    validates :email, presence: true, uniqueness: true
    validates :username, presence: true, uniqueness: true
end
