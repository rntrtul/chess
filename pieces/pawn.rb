require_relative "piece"

class Pawn < Piece 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2659": "\u265F"
        @icon = color_char.encode('utf-8')
    end

    def move_valid? cord
        row_moved = (cord[0]-pos[0]).abs
        col_moved = (cord[1]-pos[1]).abs
        puts row_moved.to_s + " " + col_moved.to_s

        if (row_moved == 1 && col_moved == 0)
            return true
        else 
            puts "pawn move not valid"
            return false
        end
    end
end