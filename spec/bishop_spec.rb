require_relative '../pieces/bishop'

describe Bishop do 
    test_bishop = Bishop.new([3,3], "white")

    describe "#move_valid?" do
        it "Works 2 up 2 right" do
            expect(test_bishop.move_valid?([5,5])).to eql(true)
        end
        it "works 2 up 2 left" do
            expect(test_bishop.move_valid?([5,1])).to eql(true)
        end
        it "works 2 down 2 left" do
            expect(test_bishop.move_valid?([1,1])).to eql(true)
        end
        it "works 2 down 2 right" do
            expect(test_bishop.move_valid?([1,5])).to eql(true)
        end
        it "doesn't work 2 down 1 right" do
            expect(test_bishop.move_valid?([1,4])).to eql(false)
        end
        it "doesn't work 1 up 2 left" do
            expect(test_bishop.move_valid?([4,1])).to eql(false)
        end
    end
end