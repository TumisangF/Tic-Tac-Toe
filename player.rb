# frozen_string_literal: true

# Houses information about players in the game
class Player
  include Interface
  attr_accessor :name, :player_number, :symbol

  def initialize(name, number)
    @name = name
    @player_number = number
    symbol = if @player_number == 1
               'X'
             else
               'O'
             end
    @symbol = symbol
  end
end
