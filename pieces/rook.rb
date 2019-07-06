require_relative "piece"


class Rook < Piece
    @@move_pattern = [[1,0],[-1,0],[0,1],[0,-1]]
    @@move_upto = 8

    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2656": "\u265C"
        @icon = color_char.encode('utf-8')
    end
end