class AddTablePairToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_column :puzzles, :pair, :string, default: ''
    add_index :puzzles,  [:pair], unique: true
  end
end
