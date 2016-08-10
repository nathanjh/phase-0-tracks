##Interior Designer Client Profiler
# -Create a new empty hash to store client data
# -Get user input, prompt with puts statemets(to be stored in k,v pairs--hash[k] = user input)
# 	-Get client name, store as string
# 	-Get client age, store as int
#   -Get client number of children, store as int
#   -Get client desired decor theme, store as string
#   -Get client glass block preference, store as boolean
#   -Get client trap doors/hidden room preference, store as boolean
# -Print back hash keys/values for review
# -Provide opportunity to update value for a given key 
# (How do we know how to convert new modified input value to appropriate key-specific data type? see helper methods...)
#   -Puts statement to prompt user, new variable for gets.chomp.to_sym to store input
#   -If "none" or " ", reprint hash and exit
#   -Else set new value
#      -puts statement to prompt user
#      -test value data type at "profile hash"[key] using helper method
# 	   -wrap test helper method in conversion helper method to conditionally 
#      conditionally convert data to matching type
# -Print back revised hash keys/values 

#helper method to convert to boolean values
#   -takes a string
#   -test for common bool-type inputs eg. 'y', 'true', 'N', etc.
#   -conditionally converts and returns appropriate boolean value
def to_bool(input)
	case input
	when true, "true", 1, "1", "t", "T", "y", "Y" then true
	when false, "false", nil, "", 0, "0", "f", "F", "n", "N" then false
	end
end

#helper method to test data type at key
#   -takes an object and a hash
#   -test data type at hash[string], and convert 
def data_type(key, hash)
	if hash[key].class == String
		"string"
	elsif hash[key].class == Fixnum
		"int"
	elsif hash[key].class == Float
		"float"
	else hash[key].class == TrueClass || hash[key].class == FalseClass
		"boolean"
	end
end

#helper method to convert input to given data type (represented by a string)
#   -takes a string, and a data type (as a string)
# 	-conditionally converts string to data type or returns string if data type == string
#   -returns converted data
def convert_str_to(input_str, data_type)
	if data_type == "int"
		input_str.to_i
	elsif data_type == "float"
		input_str.to_f
	elsif data_type == "boolean"
		to_bool(input_str)
	else 
		input_str
	end
end

#helper method to format key printing
#   -iterates over the hash, and prints a nicely formatted string listing keys, values.
def print_profile(hash)
	puts "Client profile for #{hash[:name]}\n___________________"
	hash.each { |k, v| puts "#{k}: #{v}"}
end

#create a new hash to store our client data

client = {}
# UI
puts "Hooray, a new client!"
#name
puts "Please enter your name:"
client[:name] = gets.chomp
#age
puts "Please enter your age:"
client[:age] = gets.chomp.to_i
#number of kids
puts "Please enter number of children currently living in space to be remodeled:\n(please enter 0 if none)"
client[:num_kids] = gets.chomp.to_i
#decor style
puts "Please give us a sense of your desired style of decor in one or two words:"
client[:style] = gets.chomp
#glass block lover?
puts "How would you like a stunning new wall of glass blocks? (y/n)"
client[:glass_blocks] = to_bool(gets.chomp)
#home security question
puts "Do you expect to require any trap doors or fake-bookcase-hidden-rooms? (y/n)"
client[:trap_doors] = to_bool(gets.chomp)
puts ".\n.\n.\n.\n.\n.\n.\n.\n.\nThanks for your input!!!\nPlease take a moment to review your answers..."
print_profile(client)
puts "Is there anything you'd like to change?\nIf so, please specify, otherwise leave blank or type 'none'."
choice = gets.chomp.to_sym
if choice == :none || choice == :""
	puts "Thanks for your interest! We'll be in touch shortly!"
	print_profile(client)
else
	puts "Please enter a new value for #{choice.to_s}"
	#using helper methods, our program now knows what sort of data to store when given a valid key name!
	client[choice] = convert_str_to(gets.chomp, data_type(choice, client))
	puts "#{choice} is now #{client[choice]}."
	#to test:
	#puts "#{client[choice]} is an instance of #{client[choice].class}."
	puts "Thanks for your interest! We'll be in touch shortly!"
	print_profile(client)
end









