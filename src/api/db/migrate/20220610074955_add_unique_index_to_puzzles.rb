class AddUniqueIndexToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_index :puzzles,  [:start, :goal], unique: true
  end
end
