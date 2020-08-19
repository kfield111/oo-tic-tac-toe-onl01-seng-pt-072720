require 'pry'

class TicTacToe
  attr_reader :board, :gets

WIN_COMBINATIONS = [
  [0,1,2],  #3
  [3,4,5],  #12
  [6,7,8],  #21
  [0,3,6],  #9
  [1,4,7],  #12
  [2,5,8],  #15
  [0,4,8],  #12
  [2,4,6]   #12
]

  def initialize
    @board = Array.new(9, " ")
  end

def display_board
  print " #{board[0]} | #{board[1]} | #{board[2]} "
  print "-----------"
  print " #{board[3]} | #{board[4]} | #{board[5]} "
  print "-----------"
  print " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index (input)
  index = input.to_i - 1
end

def move (index, token = "X")
  board[index] = token
end

def position_taken?(index)
    board[index] == " " ? false : true
end

def valid_move?(position)
    player_move = input_to_index(position)
    position.between?(0,8) && !position_taken?(position) ? true : false
end

def turn_count
board.count("X") + board.count("O")
end

def current_player
 turn_count.odd? ? "O" : "X"
end

def turn
 input = gets.to_i
 adjusted_input = input_to_index(input)
 if valid_move?(adjusted_input)
   move(adjusted_input, current_player)
 else
   turn
 end
  display_board
end


# def won?
#   #win condition exists ? if so then true : or false
#   board.each do |combinations|
#     if WIN_COMBINATIONS == combinations
#       combinations
#     else
#       false
#     end
#   end
# end

def won?
x_positions = board.each_index.select{|i| board[i] == "X"}
o_positions = board.each_index.select{|i| board[i] == "O"}

WIN_COMBINATIONS.each do |combo|
  if combo[0] && combo[1] && combo[2] == x_positions
    combo
  end
end


if x_positions.inject(0, :+) == 21
  true
  winning_combo
end
end


#INDEX:  0  1  2  3  4  5  6  7  8    --  DRAW
#ARRAY:  X  O  X  O  X  X  O  X  O


#INDEX:  0  1  2  3  4  5  6  7  8    --  WIN
#ARRAY:  X  O  X  O  X  O  O  X  X

#INDEX:  0  1  2  3  4  5  6  7  8    --  WIN
#ARRAY:  X  O  O  X  X  O  X  O  X

# 0  1  2
# 3  4  5
# 6  7  8


end
