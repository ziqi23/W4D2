require_relative "piece"
require_relative "slideable"

class Rook < Piece
    include Slideable

    attr_accessor :pos

 attr_reader :symbol
    def initialize(color, board, pos)
        super
        @symbol = (color == :black ? "♜" : "♖")
    end

    def move_dirs
        horizontal_and_vertical_dirs
    end
end