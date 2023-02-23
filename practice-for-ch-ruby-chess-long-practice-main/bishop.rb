require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable

    attr_accessor :pos

    attr_reader :symbol
    def initialize(color, board, pos)
        super
        @symbol = (color == :black ? "♝" : "♗")
    end

    def move_dirs
        diagonal_dirs
    end
end