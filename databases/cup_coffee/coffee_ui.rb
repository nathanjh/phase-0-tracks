module CoffeeUi
	#UI helper methods
	module_function

	#to process user name input
	#input is a string, test-method(predicate method), add-method
	#   call predicate method with string and relevant db info as arguments (in 
	#      this case, to test whether name exists in users.db)
	#   if method returs false, call add method (for our purposes, to add string as 
	#      a name to users.db )
	#   return name-string
	def user_name(name, pred_method, method)
		if pred_method == false 
			puts "name not found, adding...."
			method 
		end
	end	
end