# frozen_string_literal: true

# Houses the main game methods
class Game
  include Interface
  attr_accessor :player1, :player2, :board

  def initialize(player1, player2, board)
    @player1 = player1
    @player2 = player2
    @board = board
  end

  def inspect_input(player, board)
    while (input = gets.chomp.to_i)
      if input.between?(1, 9) == false
        puts 'Please enter a valid number.'
      elsif board.update_board(input, player.symbol) == false
        puts 'That space is taken!'
      else
        board.update_board(input, player.symbol)
        break
      end
    end
  end

  def play_round(player, board)
    prompt(player)
    inspect_input(player, board)
    board.display_board
  end

  def exit_game
    puts 'Thanks for playing!'
    exit
  end

  def new_or_exit(input)
    case input
    when 'y'
      play_game
    when 'n'
      exit_game
    else
      puts 'Please enter y or n'
    end
  end

  def game_over(player)
    game_over_message(player)
    while (input = gets.chomp.downcase)
      new_or_exit(input)
    end
  end

  def tie
    tie_message
    while (input = gets.chomp.downcase)
      new_or_exit(input)
    end
  end
end
