require_relative "piece"


class Rook < Piece
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2656": "\u265C"
        @icon = color_char.encode('utf-8')
    end
end