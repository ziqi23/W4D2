require_relative "piece"
require_relative "rook"
require_relative "bishop"
require_relative "queen"
require_relative "knight"
require_relative "king"
require_relative "pawn"
require_relative "null_piece"


class Board
    attr_reader :rows
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        (0..7).each do |row_idx|
            (0..7).each do |col_idx|
                coord = [row_idx, col_idx]
                if row_idx == 1 || row_idx == 6
                    @rows[row_idx][col_idx] = add_piece(:pawn, coord)
                elsif row_idx.between?(2, 5)
                    @rows[row_idx][col_idx] = NullPiece.instance
                elsif col_idx == 0 || col_idx == 7
                    @rows[row_idx][col_idx] = add_piece(:rook, coord)
                elsif col_idx == 1 || col_idx == 6
                    @rows[row_idx][col_idx] = add_piece(:knight, coord)
                elsif col_idx == 2 || col_idx == 5
                    @rows[row_idx][col_idx] = add_piece(:bishop, coord)
                elsif col_idx == 3
                    @rows[row_idx][col_idx] = add_piece(:queen, coord)
                elsif col_idx == 4
                    @rows[row_idx][col_idx] = add_piece(:king, coord)
                end
            end
        end
    end

    def add_piece(piece_sym, pos)
        row_idx, col_idx = pos
        if row_idx.between?(0, 1)
            color = :black
        else
            color = :white
        end
        case piece_sym
        when :pawn
            Pawn.new(color, self, pos)
        when :rook 
            Rook.new(color, self, pos)
        when :bishop 
            Bishop.new(color, self, pos)
        when :queen
            Queen.new(color, self, pos)
        when :knight
            Knight.new(color, self, pos)
        when :king
            King.new(color, self, pos)
        end
    end

    def valid_pos?(pos)
        x_idx, y_idx = pos
        x_idx.between?(0,7) && y_idx.between?(0,7)
    end

    def [](pos)
        x, y = pos
        @rows[x][y]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

    def move_piece(start_pos, end_pos)
        if valid_pos?(start_pos) && valid_pos?(end_pos)
            our_piece = self[start_pos]
            if our_piece.is_a?(NullPiece)
                raise "this is not a legal move - no piece at start position" 
            end
            #if our_piece.moves.include?(end_pos)
                our_piece.pos = end_pos
                self[end_pos] = our_piece
                self[start_pos] = NullPiece.instance
                return true
            #else
                raise "Cannot place this piece there :("
            #end
        else
            raise "Illegal position - start or end pos is not on the board"
        end

        # #color check
        # if !other_piece.nil? && our_piece.color == other_piece.color``
        #     raise "Not a legal move"
        # end

        # can this piece type legally move like this? based on piece type
    end

    def in_check?(color)
        king = []
        danger_zone = []
        @rows.each do |row|
            row.each do |ele|
                if ele.is_a?(King) && ele.color == color
                    king = ele
                end
                if ele.color != color && !ele.is_a?(NullPiece)
                    danger_zone += ele.moves
                end
            end
        end
        king_pos = king.pos
        danger_zone.include?(king_pos)
    end

    def checkmate?(color)
        in_check?(color) && valid_moves.empty?
    end
end

#b = Board.new
#b.move_piece([7, 3], [4, 4])
#b.move_piece([0, 0], [7, 3])
#p b.in_check?(:white)

