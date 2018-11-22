class ListNode
    attr_accessor :val, :next

    def initialize(val)
        @val = val
        @next = nil
    end
end

class List
	def initialize(val)
		@head = ListNode.new(val)
	end

	def reverse_list!
    	reversed = @head
    	next_node = @head.next
    	reversed.next = nil
    	until next_node == nil
    		current = next_node
    		next_node = next_node.next
    		current.next = reversed
    		reversed = current
    		@head = reversed
    	end
	end

	def push(val)
		current = @head
		until current.next == nil
			current = current.next
		end
		current.next = ListNode.new(val)
	end

	def show
		current = @head
		until current == nil
			print("#{current.val} -> ")
			current = current.next
		end
		print("nil\n")
	end	
end 

list = List.new(1)
list.push(2)
list.push(3)
list.push(4)
list.show

list.reverse_list!
list.show