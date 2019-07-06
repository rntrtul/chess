require "./board.rb"
require "./player.rb"

board = Board.new

black_player = Player.new "black"
black_player.set_pieces(board.board)

white_player = Player.new "white"
white_player.set_pieces(board.board)

board.draw_board
puts board.get_piece("d8").icon