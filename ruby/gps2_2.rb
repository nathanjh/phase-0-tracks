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