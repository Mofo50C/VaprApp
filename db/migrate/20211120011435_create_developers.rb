class CreateDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :name

      t.timestamps
    end

    create_table :game_developers, id: false do |t|
      t.belongs_to :game
      t.belongs_to :developer
    end
  end
end
