require_relative "piece"

class Knight < Piece
    @@move_pattern = [[2,1],[2,-1],[1,-2],[1,2],[-1,-2],[-1,2],[-2,1],[-2,-1]]
    @@move_upto = 1
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2658": "\u265E"
        @icon = color_char.encode('utf-8')
    end
end