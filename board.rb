class Board
    attr_accessor :board

    def initialize 
        @board = Array.new(8) {Array.new(8,0) }
    end

    def draw_board
        print "   +---+---+---+---+---+---+---+---+\n"
        @board.each_with_index do |row, row_num|
            print " #{row_num + 1} "
            row.each_with_index do |cell, col|
                if (cell != 0)
                    print "| #{cell.icon} "
                else
                    print "|   "
                end
            end
            print "|\n   +---+---+---+---+---+---+---+---+\n"
        end
        puts "     a   b   c   d   e   f   g   h"
    end
end