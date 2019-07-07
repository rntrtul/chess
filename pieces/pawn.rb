class Pawn 
    attr_reader :icon , :colour
    attr_accessor :pos 

    def initialize pos, colour, moved = false
        @pos = pos 
        @points = 1
        @colour = colour
        colour_set = colour == "white" ? "\u2659": "\u265F"
        @icon = colour_set.encode('utf-8')
        @moved = moved
    end

    def move_valid? cord
        row_moved =  @colour == "white" ? cord[0] - @pos[0] : @pos[0] - cord[0]
        col_moved = (cord[1]-pos[1]).abs
        
        if (@moved == false)
            if (row_moved <=2 && col_moved == 0)
                @moved = true
                return true
            else
                return false
            end
        elsif (row_moved == -1 && col_moved == 0)
            return true
        else 
            return false
        end
    end
end