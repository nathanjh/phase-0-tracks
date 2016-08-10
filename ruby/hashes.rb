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
#   -Puts statement to prompt user, new variable for gets.chomp.to_sym to store input
#   -If "none" or " ", reprint hash and exit
#   -Else set new value
#      -puts statement to prompt user
#      -test value data type at "profile hash"[key] using helper method
# 	   -wrap test helper method in conversion helper method to conditionally 
#      conditionally convert data to matching type
# -Print back revised hash keys/values 


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

h = {a: "stringy", b: 345, c: 1.5888, d: false}
p data_type(:a, h)
p data_type(:b, h)
p data_type(:c, h)
p data_type(:d, h)



#helper method to convert input to given data type
#   -takes a string, and a data type
# 	-conditionally converts string to data type or returns string if data type == string
#   -returns converted data
#helper method to format key printing
#   -iterates over the hash, and prints a nicely formatted string listing keys, values.
