require_relative '../pieces/knight'

describe Knight do 
    test_knight = Knight.new([3,3], "white")

    describe "#move_valid?" do
        it "Works 1 up 2 right" do
            expect(test_knight.move_valid?([4,5])).to eql(true)
        end
        it "works 1 up 2 left" do
            expect(test_knight.move_valid?([4,1])).to eql(true)
        end
        it "works 2 up 1 left" do
            expect(test_knight.move_valid?([5,2])).to eql(true)
        end
        it "works 2 up  1 right" do
            expect(test_knight.move_valid?([5,4])).to eql(true)
        end
        it "works 1 down 2 left" do
            expect(test_knight.move_valid?([2,1])).to eql(true)
        end
        it "works 1 down 2 right" do
            expect(test_knight.move_valid?([2,5])).to eql(true)
        end
        it "works 2 down 1 left" do
            expect(test_knight.move_valid?([1,2])).to eql(true)
        end
        it "works 2 down 1 right" do
            expect(test_knight.move_valid?([1,4])).to eql(true)
        end
    end
end