require_relative '../pieces/king'

describe King do 
    test_king = King.new([3,3], "white")

    describe "#move_valid?" do
        it "Works 1 up 0 right" do
            expect(test_king.move_valid?([4,3])).to eql(true)
        end
        it "works 1 up 1 left" do
            expect(test_king.move_valid?([4,2])).to eql(true)
        end
        it "works 1 up 1 right" do
            expect(test_king.move_valid?([4,4])).to eql(true)
        end
        it "works 0 up 1 right" do
            expect(test_king.move_valid?([3,4])).to eql(true)
        end
        it "Works 0 up 1 left" do
            expect(test_king.move_valid?([3,2])).to eql(true)
        end
        it "works 1 down 1 left" do
            expect(test_king.move_valid?([2,2])).to eql(true)
        end
        it "works 1 down 1 right" do
            expect(test_king.move_valid?([2,4])).to eql(true)
        end
        it "works 1 down 0 right" do
            expect(test_king.move_valid?([2,3])).to eql(true)
        end
        it "doesn't work 2 squares in verticle" do
            expect(test_king.move_valid?([5,3])).to eql(false)
        end
        it "doesn't work 2 squares horizontally" do
            expect(test_king.move_valid?([3,5])).to eql(false)
        end
    end
end