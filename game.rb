require "./board.rb"
require "./player.rb"
require "rainbow"
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
        
        puts"Select a Piece:"
        pos = gets.chomp

        while (pos != "stop")
            if (pos == "save")
                save
                exit
            end 

            cord = pos_to_cord pos   

            if (cord_on_board? cord)
                piece_got =  @chess_board.get_cell(cord)
                
                if (piece_got != 0)
                    puts"Move to:"
                    move_to = pos_to_cord(gets.chomp)

                    if (cord_on_board? move_to)
                        @chess_board.can_move?(move_to, piece_got)
                        @chess_board.draw_board
                    end
                else
                    puts Rainbow("Select square with a piece on it").yellow
                end
            end 
            
            puts "Select a Piece:"
            pos = gets.chomp
        end
    end

    def pos_to_cord pos
        row = pos[1].to_i - 1
        col = (pos[0].ord - 97) % 26
        
        return [row, col]
    end
    
    def cord_on_board? cord 
        if (cord[0] >= 0 && cord[0] <= 7 && cord[1] >= 0 && cord[1] <= 7)
            return true
        else
            puts Rainbow("Enter a square on the board").yellow
            return false
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
