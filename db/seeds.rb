# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puzzle = Puzzle.new
puzzle.start = "0000000000000000000011000"
puzzle.end = "0110000000000000000000000"
puzzle.minimum_moves = 3
puzzle.current = puzzle.start
puzzle.status = 'unsolved'
puzzle.save


puzzle = Puzzle.new
puzzle.start = "1000010000100001000010000"
puzzle.end = "1111100000000000000000000"
puzzle.minimum_moves = 8
puzzle.current = puzzle.start
puzzle.status = 'unsolved'
puzzle.save


puzzle = Puzzle.new
puzzle.start = "1010001000010000100000000"
puzzle.end = "0000000000111001000010000"
puzzle.minimum_moves = 6
puzzle.current = puzzle.start
puzzle.status = 'unsolved'
puzzle.save


puzzle = Puzzle.new
puzzle.start = "0000000011000000100001000"
puzzle.end = "0100001110000000000000000"
puzzle.minimum_moves = 3
puzzle.current = puzzle.start
puzzle.status = 'unsolved'
puzzle.save
