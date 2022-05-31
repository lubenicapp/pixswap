*class CreatePuzzles < ActiveRecord::Migration[7.0]
  def change
    create_table :puzzles do |t|
      t.integer :minimum_moves
      t.string :start
      t.string :end
      t.string :status

      t.timestamps
    end
  end
end
