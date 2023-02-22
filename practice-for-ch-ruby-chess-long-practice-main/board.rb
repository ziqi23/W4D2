require_relative "piece"
require_relative "rook_bishop_queen"
require_relative "knight_king"
require_relative "pawn"
require_relative "null_piece"


class Board
    def initialize
        @rows = Array.new(8) { Array.new(8) }
        # @null_piece = NullPiece.new      ## May need to replace nil with NullPiece
        (0..7).each do |row_idx|
            (0..7).each do |col_idx|
                coord = [row_idx, col_idx]
                if row_idx == 1 || row_idx == 6
                    @rows[row_idx][col_idx] = add_piece(:pawn, coord)
                elsif row_idx.between?(2, 5)
                    @rows[row_idx][col_idx] = nil
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
        if piece_sym == :pawn
            Pawn.new(color, self, pos)
        elsif piece_sym == :rook || piece_sym == :bishop || piece_sym == :queen
            RookBishopQueen.new(color, self, pos)  ## Need to preserve piece symbol for the future
        elsif piece_sym == :knight || piece_sym == :king
            KnightKing.new(color, self, pos)
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
        our_piece = self[start_pos]
        p our_piece.pos
        p end_pos
        raise "this is not a legal move" if our_piece.nil?
        if valid_pos?(start_pos) && valid_pos?(end_pos)
            our_piece.pos = end_pos
            self[end_pos] = our_piece
            self[start_pos] = nil
            return true
        else
            raise "Illegal position"
        end
        # other_piece = self[end_pos]

        # #color check
        # if !other_piece.nil? && our_piece.color == other_piece.color
        #     raise "Not a legal move"
        # end

        # can this piece type legally move like this? based on piece type
        


    end

end

b = Board.new
puts
puts
b.move_piece([0,0], [2,0])
