# frozen_string_literal: true

# Board class keeps track of state of the board during the game
class Board
  WIN_COMBOS = [
    [[0, 0], [0, 1], [0, 2]],
    [[1, 0], [1, 1], [1, 2]],
    [[2, 0], [2, 1], [2, 2]],
    [[0, 0], [1, 0], [2, 0]],
    [[0, 1], [1, 1], [2, 1]],
    [[0, 2], [1, 2], [2, 2]],
    [[0, 0], [1, 1], [2, 2]],
    [[0, 2], [1, 1], [2, 0]]
  ].freeze

  def initialize
    @board_array = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  end

  private

  def update_array_value(val_a, val_b, input)
    @board_array[val_a][val_b] = input
  end

  public

  def display_board
    @board_array.each do |row|
      print "#{row[0]} | #{row[1]} | #{row[2]}"
      print "\n"
      puts '----------' if row != @board_array[2]
    end
  end

  def update_board(input, symbol)
    @board_array.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if input == cell
          update_array_value(row_index, cell_index, symbol)
          return true
        end
      end
    end
    false
  end

  def winner?(symbol)
    WIN_COMBOS.any? do |row|
      row.all? { |cell| @board_array[cell[0]][cell[1]] == symbol }
    end
  end

  def board_full?
    @board_array.all? do |row|
      row.all? { |cell| %w[X O].include?(cell) }
    end
  end
end
