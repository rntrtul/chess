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
    
    def pos_to_cord pos
        row = pos[1].to_i - 1
        col = (pos[0].ord - 97)%26
          
        return [row, col]
    end

    def get_piece pos 
        cord = pos_to_cord pos  
        
        return @board[cord[0]][cord[1]]
    end

    def move_piece pos , piece
        cord = pos_to_cord pos
        @board[piece.pos[0]][piece.pos[1]] = 0
        @board[cord[0]][cord[1]] = piece
        piece.pos = cord
    end
end