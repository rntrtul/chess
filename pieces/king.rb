require_relative "piece"


class King < Piece 
    attr_reader :icon 
    attr_accessor :pos 

    def initialize pos, color
        @pos = pos 
        color_char = color == "white" ? "\u2654": "\u265A"
        @icon = color_char.encode('utf-8')
    end

    def check?
    end

    def check_mate?
    end

    def castle?
    end
end