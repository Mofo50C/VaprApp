class User < ApplicationRecord
    has_secure_password
    has_many :reviews
    has_many :games, through: :reviews
    has_many :orders
    has_many :games, through: :orders
    validates :username, :email, presence: true
    validates :username, uniqueness:true
    validates :email, uniqueness: true

    before_validation :format_email_username

    private
    
    def format_email_username
        self.email = email.downcase
        self.username = username.downcase
    end

    
end
