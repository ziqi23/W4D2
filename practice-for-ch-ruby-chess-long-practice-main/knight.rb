require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end

    def move_diffs
        offset_arr = [[1, 2],
                      [2, 1],
                      [-2, 1],
                      [1, -2],
                      [-1, -2],
                      [-2, -1],
                      [-1, 2],
                      [2, -1]]
    end
end