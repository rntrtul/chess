require_relative "piece"

class Pawn < Piece 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2659": "\u265F"
        @icon = color_char.encode('utf-8')
    end
end