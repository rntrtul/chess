class Pawn 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color, moved = false
        @pos = pos 
        @color = color
        color_set = color == "white" ? "\u2659": "\u265F"
        @icon = color_set.encode('utf-8')
        @moved = moved
    end

    def move_valid? cord
        row_moved =  @color == "white" ? cord[0] - @pos[0] : @pos[0] - cord[0]
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