class CreateGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end

    create_table :game_genres, id: false do |t|
      t.belongs_to :game
      t.belongs_to :genre
    end
  end
end
