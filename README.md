# README


Ruby 3.1.2
Rails 

## Puzzle Game "Pixswap"

Game consists in solving little puzzles in the lowest number of moves

You are given a start grid and a goal grid like :

start:                            goal:
0 0 1 0 0                         0 0 0 0 0
0 0 0 0 0                         0 0 0 1 0
0 0 0 0 0                         0 0 0 0 0
0 0 0 0 0                         0 0 0 0 0
0 0 0 0 0                         0 0 0 0 0 

You can apply transformation on rows and columns of the grid to make
it exactly like the goal.

you can shift left or right a row:

shift_left: '11000' => '10001' 
shift_right: '11000' => '01100'

or shift up or down columns:

shift_up:

0     =>    0
0           0
0           1
1           1
1           0

shift_down:

0     =>    1
0           0
0           0
1           0
1           1

____

To play, go to 
[get] "/challenge"
to see the next unsolved puzzle
you are then redirected to "/puzzles/id"

[post] "/puzzle/id/:move/"
to apply a transformation on the puzzle
pass in the parameters 
direction: ("up", "left", "down", "right")
line: (the number of the column or row to move [0..4])

[post] "/puzzles/reset"
to reset progression on all puzzles

[post] "puzzles/:id/reset"
to reset progression on specific puzzle
____

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
