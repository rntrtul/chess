require_relative "piece"

class Knight < Piece
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2658": "\u265E"
        @icon = color_char.encode('utf-8')
    end
end