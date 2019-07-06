require_relative "piece"

class Bishop < Piece 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2657": "\u265D"
        @icon = color_char.encode('utf-8')
    end
end