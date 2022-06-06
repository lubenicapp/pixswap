# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

joe = User.new
joe.email = "joe@taxi.fr"
joe.password = "123456"
joe.save

ben = User.new
ben.email = "ben@beton.fr"
ben.password = "123456"
ben.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '00000'\
                '00000'\
                '00000'\
                '11000'
puzzle.goal = '01100'\
              '00000'\
              '00000'\
              '00000'\
              '00000'
puzzle.minimum_moves = 3
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '10000'\
                '10000'\
                '10000'\
                '10000'\
                '10000'
puzzle.goal = '11111'\
              '00000'\
              '00000'\
              '00000'\
              '00000'
puzzle.minimum_moves = 8
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '10100'\
                '01000'\
                '01000'\
                '01000'\
                '00000'
puzzle.goal = '00000'\
              '00000'\
              '11100'\
              '10000'\
              '10000'
puzzle.minimum_moves = 6
puzzle.save

puzzle = Puzzle.new
puzzle.start = '00000'\
               '00011'\
               '00000'\
               '01000'\
               '01000'
puzzle.goal = '01000'\
              '01110'\
              '00000'\
              '00000'\
              '00000'
puzzle.minimum_moves = 3
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '00100'\
                '00100'\
                '00011'\
                '00011'
puzzle.goal = '00100'\
              '00100'\
              '00100'\
              '10000'\
              '11000'
puzzle.minimum_moves = 5
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '00000'\
                '01110'\
                '01010'\
                '01110'
puzzle.goal = '00000'\
              '00000'\
              '00100'\
              '01110'\
              '11011'
puzzle.minimum_moves = 5
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '00000'\
                '01110'\
                '01010'\
                '01110'
puzzle.goal = '00000'\
              '00000'\
              '00100'\
              '01110'\
              '11011'
puzzle.minimum_moves = 5
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '00000'\
                '01110'\
                '01010'\
                '01110'
puzzle.goal = '00000'\
              '00000'\
              '00100'\
              '01110'\
              '11011'
puzzle.minimum_moves = 5
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00010'\
                '00011'\
                '00100'\
                '11000'\
                '01000'
puzzle.goal = '00000'\
              '01010'\
              '01110'\
              '01010'\
              '00000'
puzzle.minimum_moves = 6
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '11000'\
                '10100'\
                '01000'\
                '00000'\
                '00000'
puzzle.goal = '00000'\
              '00000'\
              '00011'\
              '00100'\
              '00101'
puzzle.minimum_moves = 9
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '00100'\
                '01110'\
                '00100'\
                '00000'
puzzle.goal = '00000'\
              '01010'\
              '00100'\
              '01010'\
              '00000'
puzzle.minimum_moves = 5
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '01110'\
                '01110'\
                '11111'\
                '00000'\
                '00000'
puzzle.goal = '00000'\
              '01000'\
              '11111'\
              '01110'\
              '01010'
puzzle.minimum_moves = 6
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00000'\
                '01010'\
                '00100'\
                '01010'\
                '01110'
puzzle.goal = '01010'\
              '01010'\
              '00100'\
              '00000'\
              '01110'
puzzle.minimum_moves = 4
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00100'\
                '01010'\
                '00010'\
                '00100'\
                '00100'
puzzle.goal = '00000'\
              '01010'\
              '00100'\
              '00100'\
              '01010'
puzzle.minimum_moves = 5
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00100'\
                '11000'\
                '01000'\
                '00000'\
                '00000'
puzzle.goal = '00000'\
              '00000'\
              '00100'\
              '00110'\
              '00010'
puzzle.minimum_moves = 7
puzzle.save

puzzle = Puzzle.new
puzzle.start =  '00110'\
                '00010'\
                '00011'\
                '00001'\
                '00001'
puzzle.goal = '00001'\
              '00000'\
              '11000'\
              '10110'\
              '00100'
puzzle.minimum_moves = 8
puzzle.save
