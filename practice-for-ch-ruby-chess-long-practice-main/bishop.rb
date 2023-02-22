require_relative "piece"
require_relative "slideable"

class Bishop < Piece
    include Slideable

    attr_accessor :pos

    def initialize(color, board, pos)
        super
    end
end