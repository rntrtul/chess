Dir["./pieces/*.rb"].each {|file| require file }

class Player
    attr_accessor :pieces

    def initialize colour
        @colour = colour
        @pieces = []
    end

    def set_pieces board
        row_pawn = @colour == 'white'? 6 : 1
        row_king = @colour == 'white'? 7 : 0

        board[row_pawn].each_with_index do |cell,col|
            board[row_pawn][col] = Pawn.new([row_pawn,col], @colour)
            @pieces << board[row_pawn][col]
        end

        board[row_king][0] = Rook.new([row_king,0], @colour)
        board[row_king][1] = Knight.new([row_king,1], @colour)
        board[row_king][2] = Bishop.new([row_king,2], @colour)
        board[row_king][3] = Queen.new([row_king,3], @colour)
        board[row_king][4] = King.new([row_king,4], @colour)
        board[row_king][5] = Bishop.new([row_king,5], @colour)
        board[row_king][6] = Knight.new([row_king,6], @colour)
        board[row_king][7] = Rook.new([row_king,7], @colour) 

        board[row_king].each_with_index do |piece, col|
            @pieces << board[row_king][col]
        end
    end
end