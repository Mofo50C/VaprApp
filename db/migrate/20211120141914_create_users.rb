class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :nickname
      t.string :username
      t.string :email
      t.string :password

      t.timestamps
    end

    create_table :user_games, id: false do |t|
      t.belongs_to :user
      t.belongs_to :game
    end
  end
end
