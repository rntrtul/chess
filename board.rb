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
        dest_cord = pos_to_cord pos 

        if (cord_on_board?dest_cord )
            cell = @board[dest_cord[0]][dest_cord[1]]      
            return cell if cell != 0
        else
            return 0
        end
    end

    def can_move? pos, piece
        dest_cord = pos_to_cord(pos)

        if (piece.move_valid? dest_cord)
            if(path_clear?(dest_cord,piece))
                move_piece(dest_cord,piece)
            elsif(attacking?(dest_cord,piece))
                move_piece(dest_cord,piece)
            end

            return true
        else
            return false
        end
    end

    def move_piece dest_cord, piece
        @board[piece.pos[0]] [piece.pos[1]] = 0
        @board[dest_cord[0]][dest_cord[1]] = piece
        piece.pos = dest_cord
    end

    def attacking? dest_cord, piece 
        cell = @board[dest_cord[0]][dest_cord[1]]
        
        if (cell != 0)
            return true if (cell.colour != piece.colour)
        end

        return false
    end

    def path_clear? dest_cord, piece
        row_moved = (dest_cord[0] - piece.pos[0]).abs
        col_moved = (dest_cord[1] - piece.pos[1]).abs
        next_cord = [0,0]
        direction = direction_move(dest_cord, piece)

        if (row_moved == col_moved) # bishop/queen movement
            for i in 1..row_moved do
                next_cord = [piece.pos[0] + direction[0] * i, piece.pos[1] + direction[1] * i]
                return false if @board[next_cord[0]][next_cord[1]] != 0
            end
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
        else
            return false if @board[dest_cord[0]][dest_cord[1]] != 0
        end

        return true
    end

    def direction_move dest_cord, piece
        row_direction = dest_cord[0] - piece.pos[0] >= 0 ? 1 : -1
        col_direction = dest_cord[1] - piece.pos[1] >= 0 ? 1 : -1
        
        return [row_direction, col_direction]
    end
end