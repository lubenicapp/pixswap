class CreateGames < ActiveRecord::Migration[7.0]
  def change
    create_table :games do |t|
      t.string :current
      t.integer :move_count

      t.timestamps
    end
  end
end
