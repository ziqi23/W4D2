require "colorize"
require_relative "cursor"
require_relative "board"

class Display
    attr_reader :cursor
    def initialize
        @board = Board.new
        @cursor = Cursor.new([0, 0], @board)
    end

    def render
        @board.rows.each_with_index do |row, i|
            row_to_print = ""
            row.each_with_index do |piece, j|
                #helper method here - what color to paint
                if [i, j] == @cursor.cursor_pos
                    print piece.to_s.ljust(3).colorize(:red)
                else
                print piece.to_s.ljust(3)
                end
                # row_to_print += piece.to_s.colorize(:green).ljust(20)
            end
            puts
        end
    end
end

# text = "abc"
# text.colorize(:green)
# puts text

# d = Display.new
# d.render
# d.cursor.get_input
# d.render
# d.cursor.get_input
# d.render
# d.cursor.get_input
# d.render
# d.cursor.get_input
# d.render
# d.cursor.get_input
# d.render
# d.cursor.get_input
# d.render