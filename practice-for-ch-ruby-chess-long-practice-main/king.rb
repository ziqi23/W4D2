require_relative "piece"
require_relative "stepable"

class King < Piece
    include Stepable

    def initialize(color, board, pos)
        super
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