# frozen_string_literal: true
unless @puzzle.nil?
  json.id @puzzle.id
  json.status @puzzle.status
  json.best_score @puzzle.best_score
  json.theoretical_best @puzzle.minimum_moves
  json.move_count @puzzle.move_count
  json.start @puzzle.start
  json.current @puzzle.current
  json.goal @puzzle.goal
end
