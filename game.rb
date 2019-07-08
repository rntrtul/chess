require "./board.rb"
require "./player.rb"
require "oj"

class Game
    attr_reader :chess_board , :black, :white
    
    private
    def initialize
        @chess_board = Board.new

        @black = Player.new "black"
        @black.set_pieces(@chess_board.board)

        @white = Player.new "white"
        @white.set_pieces(@chess_board.board)

        puts "Do you wish to open an old saved game? (Y/N)"
        input = gets.chomp
        load if input.downcase == "y"

        game_loop
    end

    def game_loop
        @chess_board.draw_board
        
        puts"enter pos of piece you wish to move"
        pos = gets.chomp

        while (pos != "stop")
            if (pos == "save")
                save
                exit
            end    
            
            piece_got =  @chess_board.get_cell(pos)
            
            if (piece_got != 0)
                puts"enter pos you want to go to"
                move_to = gets.chomp

                @chess_board.can_move?(move_to, piece_got)
                @chess_board.draw_board
            else
                puts "enter a valid square with a valid piece"
            end
            
            puts "enter pos of piece you wish to move"
            pos = gets.chomp
        end
    end

    def save 
        puts "Enter your save name(don't use 0, it will be non-loadable): "
        file_name = gets.chomp
        file_path = "saved_games/#{file_name}"
        Dir.mkdir "saved_games" unless Dir.exists? "saved_games"
    
        File.open(file_path, 'w') do |file|
          file.puts Oj.dump self   
        end
    
        puts "Game saved"
      end
      
    def load 
        puts "Game saves:"
        saved_games = Dir.entries("saved_games").reject{|entry| entry == "." || entry == ".."}
        puts saved_games

        puts "Enter the save you wish to load (0 if you want a new game)"
        save_name = gets.chomp
        if (save_name != "0")
            file_path = "saved_games/#{save_name}"
            file = File.open(file_path, 'r')
        
            load = Oj.load(file)
            puts "Game loaded"
        
            @chess_board = load.chess_board
            @black = load.black
            @white = load.white
        end

        game_loop
    end
end

game = Game.new
