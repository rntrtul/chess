require "./board.rb"
require "./player.rb"

board = Board.new

black_player = Player.new "black"
black_player.place_pieces(board.board)

white_player = Player.new "white"
white_player.place_pieces(board.board)

board.draw_board