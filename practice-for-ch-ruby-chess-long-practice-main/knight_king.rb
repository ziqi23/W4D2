require_relative "piece"
require_relative "stepable"

class KnightKing < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end
end