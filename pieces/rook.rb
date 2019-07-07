class Rook 
    attr_reader :icon , :colour , :points
    attr_accessor :pos 

    def initialize pos, colour
        @pos = pos 
        @points = 5
        @colour = colour
        colour_char = colour == "white" ? "\u2656": "\u265C"
        @icon = colour_char.encode('utf-8')
    end

    def move_valid? cord
        row_moved = (cord[0] - @pos[0]).abs
        col_moved = (cord[1] - @pos[1]).abs

        if (row_moved <= 8 && col_moved == 0 || row_moved == 0  && col_moved <= 8 )
            return true
        else
            return false
        end
    end
end