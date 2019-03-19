require "singleton"
class Piece
  attr_reader :color, :type

  def initialize(color, type)
    @color = color
    @type = type
  end
end

class NullPiece < Piece
  include Singleton
  def initialize
    @type = "-"
  end
end