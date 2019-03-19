require 'byebug'
require_relative "piece"
class Board
  
  attr_reader :grid

  def initialize
    piece_arr = ["R", "N", "B", "Q", "K", "B", "N", "R"]
    # debugger
    @grid = Array.new(8) { Array.new(8, NullPiece.instance) }
    [0,1,6,7].each do |row|
      (0..7).each do |col|
        if row == 0
          @grid[row][col] = Piece.new(:white, piece_arr[col])
        elsif row == 1
          @grid[row][col] = Piece.new(:white, "P")
        elsif row == 6
          @grid[row][col] = Piece.new(:black, "P")
        else
          @grid[row][col] = Piece.new(:black, piece_arr[col])
        end
      end
    end  
  end

  def [](pos)
    begin
      row, col = pos
      @grid[row][col]
    rescue StandardError => e
      puts "Enter valid position (0-7)"
    end
  end

  def []=(pos, piece)
    row, col = pos
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    square1, square2 = self[start_pos], self[end_pos]
    if square1.is_a?(NullPiece)
      puts "Make sure that there is a piece at start position"
    else 
      if !square2.is_a?(NullPiece) && square1.color == square2.color
        puts "Invalid move"
      else
        # change later - can't take King
        self[end_pos] = square1
        self[start_pos] = NullPiece.instance
      end
    end
  end

  def valid_pos?(pos)
    pos.all? { |i| (0..7).to_a.include?(i) }
  end

end