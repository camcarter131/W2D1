require 'colorize'
require_relative 'cursor'
require_relative 'board'
class Display

  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end
  
  def render
    board.grid.each do |row|
      row.each { |piece| print piece.type + " "}
      puts
    end
  end

end