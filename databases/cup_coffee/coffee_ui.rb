module CoffeeUi
	#UI helper methods
	module_function

	#add helper method to refactor user response checking
	#clunky optional text messages need spaces in front to print correctly!

	def answer_check(ans1, ans2, op_text1="", op_text2="")
			message = "Please enter #{ans1}#{op_text1} or #{ans2}#{op_text2}"
			puts message
			variable = gets.chomp
			until variable == ans1 || variable == ans2
				puts message
				variable = gets.chomp
			end
			variable
	end


end