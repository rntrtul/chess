require_relative '../pieces/pawn'

describe Pawn do 
    test_pawn_first_move = Pawn.new([3,3], "white")
    test_pawn_moved = Pawn.new([3,3], "white", true)

    describe "#move_valid?" do
        it "Works 2 up for first move" do
            expect(test_pawn_first_move.move_valid?([5,3])).to eql(true)
        end
        it "works 1 up" do
            expect(test_pawn_first_move.move_valid?([4,3])).to eql(true)
        end
        it "Doesn't move 2 after moving once" do
            expect(test_pawn_moved.move_valid?([5,3])).to eql(false)
        end
    end
end