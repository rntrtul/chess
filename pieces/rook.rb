class Rook 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2656": "\u265C"
        @icon = color_char.encode('utf-8')
    end

    def move_valid? cord
        row_moved = (cord[0]-pos[0]).abs
        col_moved = (cord[1]-pos[1]).abs

        if (row_moved <= 8 && col_moved == 0 || row_moved == 0  && col_moved <= 8 )
            return true
        else
            return false
        end
    end
end