# frozen_string_literal: true

require_relative 'interface'
require_relative 'player'
require_relative 'game'
require_relative 'board'

def new_game
  puts "Let's play Tic-Tac-Toe!"
  board = Board.new
  player1 = Player.new('Player 1', 1)
  player2 = Player.new('Player 2', 2)

  player1.name = player1.get_player(player1)
  player2.name = player2.get_player(player2)

  board.display_board

  Game.new(player1, player2, board)
end

def execute_round(game, player)
  game.play_round(player, game.board)
  if game.board.winner?(player.symbol)
    game.game_over(player)
  elsif game.board.board_full?
    game.tie
  end
end

def play_game
  game = new_game
  loop do
    execute_round(game, game.player1)
    execute_round(game, game.player2)
  end
end

play_game
