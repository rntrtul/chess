require_relative "piece"

class Queen < Piece 
    @@move_pattern = [[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1],[0,1],[1,1]]
    @@move_upto = 8

    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2655": "\u265B"
        @icon = color_char.encode('utf-8')
    end
end