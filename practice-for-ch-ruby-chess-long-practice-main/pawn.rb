require_relative "piece"

class Pawn < Piece

 attr_reader :symbol
    def initialize(color, board, pos)
        super
        @symbol = (color == :black ? "♟" : "♙")
    end

    def moves
        forward_steps + side_attacks
    end

    private

    def at_start_row?
        if self.color == :black && self.pos[0] == 1
            return true
        elsif self.color == :white && self.pos[0] == 6
            return true
        else
            return false
        end
    end

    def forward_dir
        self.color == :black ? 1 : -1
    end

    def forward_steps
        valid_moves = []
        x_pos, y_pos = self.pos
        pos_1 = [x_pos + self.forward_dir, y_pos]
        pos_2 = [x_pos + self.forward_dir * 2, y_pos]
        
        if self.board[pos_1].is_a?(NullPiece)
            valid_moves << pos_1
            if self.at_start_row? && self.board[pos_2].is_a?(NullPiece)
                valid_moves << pos_2
            end
        end
        valid_moves
    end

    def side_attacks
        valid_moves = []
        pos_1 = [self.pos[0] + self.forward_dir, self.pos[1] + 1]
        pos_2 = [self.pos[0] + self.forward_dir, self.pos[1] - 1]
        if self.color != self.board[pos_1].color && !self.board[pos_1].is_a?(NullPiece)
            valid_moves << pos_1
        end
        if self.color != self.board[pos_2].color && !self.board[pos_2].is_a?(NullPiece)
            valid_moves << pos_2
        end
        valid_moves
    end

end