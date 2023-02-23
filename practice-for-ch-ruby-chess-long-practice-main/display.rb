require "colorize"
require_relative "cursor"
require_relative "board"

class Display
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        @cursor.cursor_pos
        @board.rows.each do |row|
            row_to_print = ""
            row.each do |piece|
                #helper method here - what color to paint
                row_to_print += piece.to_s.colorize(:green).ljust(20)
            end
            puts row_to_print
        end
        @board[@cursor.cursor_pos].to_s.colorize(:green)
    end
end

# text = "abc"
# text.colorize(:green)
# puts text

d = Display.new
d.render