# frozen_string_literal: true

# Handles interfacing with the player
module Interface
  def get_player(player)
    puts "Enter name for Player #{player.player_number}."
    gets.chomp
  end

  def prompt(player)
    puts "#{player.name}, choose a space to place an #{player.symbol}."
  end

  def game_over_message(player)
    puts "Game over! #{player.name} is the winner!"
    puts 'Play again? (Y/N)'
  end

  def tie_message
    puts "It's a tie!"
    puts 'Play again? (Y/N)'
  end
end
