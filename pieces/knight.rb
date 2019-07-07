class Knight 
    attr_reader :icon , :colour
    attr_accessor :pos 

    def initialize pos, colour
        @pos = pos 
        @points = 3
        @colour = colour
        colour_char = colour == "white" ? "\u2658": "\u265E"
        @icon = colour_char.encode('utf-8')
    end

    def move_valid? cord
        row_moved = (cord[0] - @pos[0]).abs
        col_moved = (cord[1] - @pos[1]).abs

        if (row_moved == 1 && col_moved == 2 ||row_moved == 2 && col_moved == 1)
            return true
        else
            return false
        end
    end
end