class RemoveFieldsFromPuzzles < ActiveRecord::Migration[7.0]
  def change
    remove_column :puzzles, :move_count, :integer
    remove_column :puzzles, :current, :string
    remove_column :puzzles, :status, :string
  end
end
