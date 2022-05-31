# frozen_string_literal: true

class AddMoveCounterToPuzzles < ActiveRecord::Migration[7.0]
  def change
    add_column :puzzles, :move_count, :integer
  end
end
