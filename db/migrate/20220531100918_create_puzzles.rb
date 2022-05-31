class CreatePuzzles < ActiveRecord::Migration[7.0]
  def change
    create_table :puzzles do |t|
      t.integer :minimum_moves
      t.integer :best_score

      t.string :start
      t.string :end
      t.string :current

      t.string :status

      t.timestamps
    end
  end
end
