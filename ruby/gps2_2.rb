# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # create an empty hash to store items
  # take input string and break out items into an array
  # for each item in array
  #   - add to hash as a key with default value of one
  # print the list to the console using print-list method
# output: hash with items as keys and qty values

# Method to add an item to a list
# input: list hash, item name, and optional quantity
# steps: add item name key with optional quantity value to hash
# output: modified hash

# Method to remove an item from the list
# input: list hash, item name
# steps: delete item from hash
# output: modified hash

# Method to update the quantity of an item
# input: list hash, item name, updated qty
# steps: call item name key in hash and overwrite with new qty
# output: modified hash

# Method to print a list and make it look pretty
# input: list hash
# steps: print key value pairs with nice formatting
# output: hash as is, with strings printed to console

#release 2

#list print method
def print_list(list_hash)
	list_hash.each do |item, qty|
		puts "#{item}: #{qty}"
	end
end

#create a list method
def create_list(string_of_items) #needs to be separated by single spaces
	new_list = {}
	items_array = string_of_items.split(" ")
	items_array.each { |item| new_list[item] = 1 }
	print_list(new_list)
	new_list
end

def add_to_list(list_hash, item, qty=1)
	list_hash[item] = qty
	list_hash
	#call list print method to confirm changes
end


list = create_list("carrots apples cereal pizza")
p list.class













