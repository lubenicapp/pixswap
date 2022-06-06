# Pixswap

## How to play

Game consists in solving little puzzles in the lowest number of moves
You can view the puzzles as 2D rubik's cubes

You are given a start grid and a goal grid like :

```
start:                            goal:
0 0 1 0 0                         0 0 0 0 0
0 0 0 0 0                         0 0 0 1 0
0 0 0 0 0                         0 0 0 0 0
0 0 0 0 0                         0 0 0 0 0
0 0 0 0 0                         0 0 0 0 0  
```

You can apply transformation on rows and columns of the grid to make
it exactly like the goal.

you can shift left or right a row:

```
shift_left: '11000' => '10001' 

shift_right: '11000' => '01100' 
```

or shift up or down columns:

```
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
```

____

## Sign in

You must be identified to play. One dummy used is registered in the seed.rb

email "joe@taxi.fr"
password "123456"

you can request an access token at "/sign_in"

``` 
curl -u "joe@taxi.fr:123456" 127.0.0.1:3000/sign_in

# { token : "bla" }

```

then use it in the Autorization header

``` 
    curl -X POST "/challenge" -H "Authorization: Bearer bla"
```


## Controls to play
### (you must be logged in)
\
to see the next unsolved puzzle :
``` 
[get] /challenge
```
\
to play a move:
``` 
[post] /puzzle/id/:move/
```
with params:
``` 
direction: ("up", "left", "down", "right")
line: (the number of the column or row to move [0..4])
```
\
to reset progression on all puzzles:
``` 
[post] "/puzzles/reset"
```
\
to reset progression on specific puzzle:
``` 
[post] "puzzles/:id/reset"
```


_______________________

# Run the app

This app runs on 
- Rails 7.0.3
- Ruby 3.1.2

install gems
```bash
  bundle install 
```
\
start the database
```
 docker-compose up -d
```
populate the database
``` bash
 rails db:migrate && rails db:seed
```
\
run the server
```bash
  rails server 
```


