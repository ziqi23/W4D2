

class Piece

    attr_reader :pos, :board, :color

    def initialize(color, board, pos)
        @color = color
        @board = board
        @pos = pos
    end

    def pos=(new_pos)
        @pos = new_pos
        # @pos[0] = new_pos[0]
        # @pos[1] = new_pos[1]
    end
    
    def moves 
        raise NotImplementedError
    end
end