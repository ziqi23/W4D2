module Stepable

    def moves
      # create array to collect moves
        moves_arr = []
        x_pos, y_pos = self.pos
      # iterate through each of the piece's possible move_diffs
        # for each move_diff, increment the piece's position to generate a new position
        # add the new position to the moves array if it is:
          # on the board and empty
          # OR on the board and contains a piece of the opposite color
        self.move_diffs.each do |(dx, dy)|
            new_pos = [x_pos + dx, y_pos + dy]
            if self.board.valid_pos?(new_pos) && self.board[new_pos] == NullPiece.instance
                moves_arr << new_pos
            elsif self.board.valid_pos?(new_pos) && self.color != self.board[new_pos].color
                moves_arr << new_pos
            end
        end
  
      # return the final array of moves
        moves_arr
    end
  
    private
  
    def move_diffs
      # subclass implements this
      raise NotImplementedError
    end
  end
  
  
  # Note: you can invoke methods from the piece from within the module methods, and vice versa. It is a two way street!