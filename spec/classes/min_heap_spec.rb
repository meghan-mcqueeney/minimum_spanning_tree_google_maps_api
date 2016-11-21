require 'rails_helper'

RSpec.describe MinHeap, type: :class do


  describe 'initialization tests' do

    it 'initializes with a null element at the first position' do
      min_heap = MinHeap.new
      expect(min_heap.count).to eq(1)
    end

    it 'peek min is nil with no elements' do
      min_heap = MinHeap.new
      expect(min_heap.peek_min).to eq(nil)
    end
  end

  describe 'min heap ordering on insert' do

    it 'preserves ordering of one element' do
      min_heap = MinHeap.new
      node = Node.new(node_data: 1)
      min_heap << node
      expect(min_heap.count).to eq(2)
      expect(min_heap.peek_min).to eq(node)
    end

    it 'preserves ordering of two elements in order' do
      min_heap = MinHeap.new
      node1 = Node.new(node_data: 1, key: 1)
      node2 = Node.new(node_data: 2, key: 2)
      min_heap << node1
      min_heap << node2
      expect(min_heap.count).to eq(3)
      expect(min_heap.peek_min).to eq(node1)
    end

    it 'preserves ordering of two elements reverse' do
      min_heap = MinHeap.new
      node1 = Node.new(node_data: 1, key: 1)
      node2 = Node.new(node_data: 2, key: 2)
      min_heap << node2
      min_heap << node1
      expect(min_heap.count).to eq(3)
      expect(min_heap.peek_min).to eq(node1)
    end

    it 'preserves ordering of three elements out of order' do
      min_heap = MinHeap.new
      node1 = Node.new(node_data: 1, key: 1)
      node2 = Node.new(node_data: 2, key: 2)
      node3 = Node.new(node_data: 3, key: 3)
      min_heap << node3
      min_heap << node1
      min_heap << node2
      expect(min_heap.count).to eq(4)
      expect(min_heap.peek_min).to eq(node1)
    end

  end


  describe 'extract min testing' do

    it 'insert in asc - preserves ordering after extract min' do
      min_heap = MinHeap.new
      for i in 1..10
        min_heap << Node.new(node_data: i, key: i)
      end
      expect(min_heap.count).to eq(11)
      expect(min_heap.peek_min.node_data).to eq(1)

      node = min_heap.extract_min
      expect(node.node_data).to eq(1)
      expect(min_heap.count).to eq(10)
    end

    it 'insert in desc - preserves ordering after extract min' do
      min_heap = MinHeap.new
      for i in 1..10
        min_heap << Node.new(node_data: 11 - i, key: 11 - i)
      end
      expect(min_heap.count).to eq(11)
      expect(min_heap.peek_min.node_data).to eq(1)

      node = min_heap.extract_min
      expect(node.node_data).to eq(1)
      expect(min_heap.count).to eq(10)
    end

  end


end