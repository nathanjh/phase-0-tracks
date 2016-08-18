#release 1

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
	puts "*Grocery List*"
	list_hash.each do |item, qty|
		puts "#{item}: #{qty}"
	end
	puts "--------------------"
end

#create a list method
def create_list(string_of_items) #needs to be separated by single spaces
	new_list = {}
	items_array = string_of_items.split(" ")
	items_array.each { |item| new_list[item] = 1 }
	print_list(new_list)
	new_list
end

#add item and optional quantity or update qty if pre-existing item
def add_or_update_item(list_hash, item, qty=1)
	list_hash[item] = qty
	print_list(list_hash)
	list_hash
end

#removes an item from list
def remove_item(list_hash, item)
	list_hash.delete(item)
	print_list(list_hash)
	list_hash
end

#test code
list = create_list("carrots apples cereal pizza")
p list.class
add_or_update_item(list, "avocado", 5)
print_list(list)
add_or_update_item(list, "broccoli")
print_list(list)
remove_item(list, "apples")
add_or_update_item(list, "avocado", 3)

#release 5
# # - Going into this challenge, I was feeling a little bit shaky about my pseudocoding--I actually
# #opted to drive first in order to get more practice with this.  Having had the opportunity to 
# #work wtih my pair and guide on this, I feel a bit more confident with pseudocode.  When used 
# #as an organizing principle, good clear pseudocode makes actual coding much easier and really
# #helps to keep the digressions to a minimum.

# # - Using arrays to store the type of list data required in this challenge would have 
# #been somewhat more cumbersome, and would have described the concept (of a list of items and 
# #corresponding quantities) in a more roundabout fashion.  I would assume that a two dimensional
# #array would be used to store two element arrays representing items and corresponding qtys.  This 
# #would neccessitate another level of translation, something like:
# def create_ary_list(string_of_items)
# 	new_list = []
# 	items_array = string_of_items.split(" ").each { |item| new_list << [item, 1]}#one is default qty
# 	new_list
# end
# #to test
# array_list = create_ary_list("carrots apples cereal pizza")
# p array_list
# #to access an item
# pizza = array_list[3][0]
# #new qty for apples
# array_list[1][1] = 50
# p array_list
# # In order to access any given item you'd need another level of translation, and would need 
# #to search the array to check values for any parameter input into a method...totally doable,
# #but why?  Perhaps you needed an ordered list, and wanted to easily manipulate the ordering?  I'd 
# #imagine that would be pretty tricky to do with a hash.  With the hash, you give up the ordering, 
# #but gain a much simpler and more direct structure with which to work.

# # - A method (in Ruby) returns the last line of code executed, or an explict return statement.

# # - Methods can take all sorts of things as arguments--simple objects like strings, numbers, etc. as 
# #well as data structures like arrays and hashes, other methods (when the return value type is expected by
# #the method), and also blocks (I'm sure there's more).

# # - Information can be passed between methods by using method return values as arguments.

# # - I appreaciated the extra practice in critically approaching a problem with multiple solutions.
# #It was a great excercise to force myself to tackle a problem in a way that might not be 
# #my first choice solution, and then to have to see it to the end.  
