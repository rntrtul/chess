class Bishop
    attr_reader :icon , :colour
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2657": "\u265D"
        @icon = color_char.encode('utf-8')
    end

    def move_valid? cord
        row_moved = (cord[0] - @pos[0]).abs
        col_moved = (cord[1] - @pos[1]).abs

        if (row_moved == col_moved)
            return true
        else
            return false
        end
    end
end