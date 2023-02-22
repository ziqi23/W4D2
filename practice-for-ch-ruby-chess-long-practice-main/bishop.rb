require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable

    attr_accessor :pos

    def initialize(color, board, pos)
        super
    end

    def move_dirs
        diagonal_dirs
    end
end