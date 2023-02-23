require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable

    attr_reader :symbol
    def initialize(color, board, pos)
        super
        @symbol = (color == :black ? "♚" : "♔")
    end

    def move_diffs
        offset_arr = [[1, 0],
                      [0, 1],
                      [-1, 0],
                      [0, -1],
                      [1, 1],
                      [-1, 1],
                      [1, -1],
                      [-1, -1]]
    end


end