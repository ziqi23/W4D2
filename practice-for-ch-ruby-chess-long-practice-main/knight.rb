require_relative "piece"
require_relative "stepable"

class Knight < Piece
    include Stepable

    def initialize(color, board, pos)
        super
    end
end