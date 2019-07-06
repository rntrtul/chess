require_relative "piece"

class Queen < Piece 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2655": "\u265B"
        @icon = color_char.encode('utf-8')
    end
end