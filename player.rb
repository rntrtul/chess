Dir["./pieces/*.rb"].each {|file| require file }

class Player
    def initialize color
        @color = color
    end

    def set_pieces board
        row_pawn = @color == 'white'? 6 : 1
        row_king = @color == 'white'? 7 : 0

        board[row_pawn].each_with_index do |cell,index|
            board[row_pawn][index] = Pawn.new([row_pawn,index], @color)
        end
        
        board[row_king][0] = Rook.new([row_king,0], @color)
        board[row_king][1] = Knight.new([row_king,1], @color)
        board[row_king][2] = Bishop.new([row_king,2], @color)
        board[row_king][3] = Queen.new([row_king,3], @color)
        board[row_king][4] = King.new([row_king,4], @color)
        board[row_king][5] = Bishop.new([row_king,5], @color)
        board[row_king][6] = Knight.new([row_king,6], @color)
        board[row_king][7] = Rook.new([row_king,7], @color) 
    end
end