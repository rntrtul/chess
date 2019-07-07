require_relative '../pieces/pawn'

describe Pawn do 
    test_pawn_white = Pawn.new([3,3], "white")
    test_pawn_black = Pawn.new([3,3], "black")
    test_pawn_moved = Pawn.new([3,3], "white", true)

    describe "#move_valid?" do
        it "Works 2 up for first move" do
            expect(test_pawn_white.move_valid?([5,3])).to eql(true)
        end
        it "works 1 up" do
            expect(test_pawn_white.move_valid?([4,3])).to eql(true)
        end
        it "black can move 1 down" do
            expect(test_pawn_black.move_valid?([2,3])).to eql(true)
        end
        it "white can't move 1 down" do
            expect(test_pawn_white.move_valid?([2,3])).to eql(false)
        end
        it "black can't move 1 up" do
            expect(test_pawn_black.move_valid?([4,3])).to eql(false)
        end
        it "Doesn't move 2 after moving once" do
            expect(test_pawn_moved.move_valid?([5,3])).to eql(false)
        end
    end
end