class TodoList
	attr_reader :get_items

	def initialize(list_ary)
		@get_items = list_ary
	end

	def add_item(item)
		@get_items << item
	end

	def delete_item(item)
		@get_items.delete(item)
		@get_items
	end

	def get_item(index)
		@get_items[index]
	end
	
end
