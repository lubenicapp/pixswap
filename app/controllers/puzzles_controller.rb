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
    puzzle = Puzzle.find_by_id(params[:id])
    puzzle&.destroy
  end

  def move
    puzzle = Puzzle.find_by_id(params[:id])
    valid_move = puzzle&.move(params)
    if valid_move
      puzzle.save
      redirect_to puzzle_path
    else
      redirect_to puzzle_path, status: :unprocessable_entity
    end
  end

  def challenge
    puzzle = Puzzle.where("status == 'unsolved'").first
    redirect_to controller: 'puzzles', action: 'show', id: puzzle&.id
  end

  def reset
    puzzles = Puzzle.all
    puzzles.each do |p|
      p.status = 'unsolved'
      p.move_count = 0
      p.current = p.start
      p.save
    end
  end
end
