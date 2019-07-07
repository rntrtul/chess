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

    def cord_on_board? cord 
        if(cord[0]>= 0 && cord[0]<=7 && cord[1]>= 0 && cord[1]<=7 )
            return true
        else
            return false
        end
    end

    def get_piece pos 
        cord = pos_to_cord pos 

        if (cord_on_board?cord )
            cell = @board[cord[0]][cord[1]]      
            return cell if cell != 0
        else
            return 0
        end
    end

    def move_piece pos, piece
        cord = pos_to_cord pos
        if (piece.move_valid? cord) 
            if(path_clear(cord,piece))
                @board[piece.pos[0]][piece.pos[1]] = 0
                @board[cord[0]][cord[1]] = piece
                piece.pos = cord
                return true
            else
                return false
            end
        else
            return false
        end
    end

    def path_clear cord, piece
        row_moved = (cord[0] - piece.pos[0]).abs
        col_moved = (cord[1] - piece.pos[1]).abs
        next_cord = [0,0]
        direction = direction_move(cord, piece)

        if (row_moved == col_moved) # bishop/queen movement
            for i in 1..row_moved do
                next_cord = [piece.pos[0] + direction[0] * i, piece.pos[1] + direction[1] * i]
                return false if @board[next_cord[0]][next_cord[1]] != 0
            end

            return true
        elsif (row_moved <= 8 && col_moved == 0 || row_moved == 0  && col_moved <= 8 ) #rook/queen movement
            axis = row_moved == 0 ? col_moved : row_moved

            for i in 1..axis do
                if (axis == row_moved)
                    next_cord = [piece.pos[0] + direction[0] * i, piece.pos[1]]
                else
                    next_cord = [piece.pos[0], piece.pos[1] + direction[1] * i]
                end
                return  false if @board[next_cord[0]][next_cord[1]] != 0
            end

            return true
        else #knight/king/pawn movement
            return true
        end
    end

    def direction_move cord, piece
        row_direction = cord[0] - piece.pos[0] >= 0? 1 : -1
        col_direction = cord[1] - piece.pos[1] >= 0? 1 : -1
        
        return [row_direction, col_direction]
    end
end