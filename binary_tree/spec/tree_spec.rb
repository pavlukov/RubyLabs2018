require 'tree'

RSpec.describe Tree do
  describe '.initialize' do
    context 'given 10' do
      let(:tree) { Tree.new(10) }
      it 'root value should be equal to 10' do
        expect(tree.root.val).to eq(10)
      end
    end

    context 'given nothing' do
      it 'root value should be equal to 0' do
        expect(Tree.new.root.val).to eq(0)
      end
    end

    context 'given non-integer value'
    it 'raises an ArgumentError error' do
      expect { Tree.new('a') }.to raise_error ArgumentError
    end
  end

  describe '.insert' do
    let(:tree) { Tree.new(10) }

    context 'given 15' do
      it 'root.right value equals 15' do
        tree.insert(tree.root, 15)
        expect(tree.root.right.val).to eq(15)
      end
    end

    context 'given 5' do
      it 'root.left value equals 5' do
        tree.insert(tree.root, 5)
        expect(tree.root.left.val).to eq(5)
      end
    end

    context 'given non-integer value' do
      it 'raises ArgumentError' do
        expect { tree.insert(tree.root, 'a') }.to raise_error ArgumentError
      end
    end

    context 'given 1 argument' do
      it 'raises ArgumentError' do
        expect { tree.insert(2) }.to raise_error ArgumentError
      end
    end
  end

  describe '.find_paths' do
    values = [5, 15, 14, 3, 7]
    let(:tree) { Tree.new(10) }
    before do
      values.each { |val| tree.insert(tree.root, val) }
    end

    context 'given wrong argument' do
      it 'raises ArgumentError' do
        expect { tree.get_paths(123) }.to raise_error ArgumentError
      end
    end

    context 'given valid params' do
      it 'paths equals ["10->5->3", "10->5->7", "10->15->14"]' do
        values = [5, 15, 14, 3, 7]
        tree = Tree.new(10)
        values.each { |val| tree.insert(tree.root, val) }
        tree.get_paths(tree.root)
        expect(tree.paths).to eq(["10->5->3", "10->5->7", "10->15->14"])
      end

      it 'paths equals ["5->2", "5->7->6", "5->7->8"]' do
        values = [2, 7, 8, 6]
        tree = Tree.new(5)
        values.each { |val| tree.insert(tree.root, val) }
        tree.get_paths(tree.root)
        expect(tree.paths).to eq(["5->2", "5->7->6", "5->7->8"])
      end
    end
  end
end
