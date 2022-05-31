# frozen_string_literal: true

class PuzzlesController < ApplicationController
  def index
    @puzzles = Puzzle.all
  end

  def create; end

  def show
    @puzzle = Puzzle.find_by_id([params[:id]])
  end

  def destroy
    puzzle = Puzzle.find(params[:id])
    puzzle.destroy
  end
end
