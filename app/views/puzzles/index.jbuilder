json.array! @puzzles do |puzzle|

  json.status puzzle.status
  json.best_score puzzle.best_score
  json.theorical_best puzzle.minimum_moves
  json.start puzzle.start
  json.end puzzle.end

end