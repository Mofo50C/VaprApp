class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.belongs_to :game
      t.decimal :total

      t.timestamps
    end
  end
end
