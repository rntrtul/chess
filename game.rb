require "./board.rb"
require "./player.rb"

board = Board.new

black_player = Player.new "black"
black_player.set_pieces(board.board)

white_player = Player.new "white"
white_player.set_pieces(board.board)

board.draw_board

puts"enter pos of piece you wish to move"
piece_pos = gets.chomp

while (piece_pos != "stop")    
    piece_got =  board.get_piece(piece_pos)
    
    if (piece_got != 0)
        puts"enter pos you want to go to"
        move_to = gets.chomp

        board.can_move?(move_to, piece_got)
        board.draw_board
    else
        puts "enter a valid square with a valid piece"
    end
    
    puts"enter pos of piece you wish to move"
    piece_pos = gets.chomp
end

board.draw_board