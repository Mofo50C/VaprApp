class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.text :description
      t.date :release_date
      t.decimal :price
      t.decimal :discount

      t.timestamps
    end
  end
end
