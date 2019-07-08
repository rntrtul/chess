class King 
    attr_reader :icon , :colour , :points
    attr_accessor :pos 

    def initialize pos, colour
        @pos = pos 
        @points = 80
        @colour = colour
        colour_char = colour == "white" ? "\u2654": "\u265A"
        @icon = colour_char.encode('utf-8')
    end

    def move_valid? cord
        row_moved = (cord[0] - @pos[0]).abs
        col_moved = (cord[1] - @pos[1]).abs

        if (row_moved <= 1 && col_moved <= 1)
            return true
        else
            return false
        end
    end

    def check?
    end

    def check_mate?
    end

    def castle?
    end
end