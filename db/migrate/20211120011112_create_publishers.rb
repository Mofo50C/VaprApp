class CreatePublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |t|
      t.string :name

      t.timestamps
    end

    create_table :game_publishers, id: false do |t|
      t.belongs_to :game
      t.belongs_to :publisher
    end
  end
end
