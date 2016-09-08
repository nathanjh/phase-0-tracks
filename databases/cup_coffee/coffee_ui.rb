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

	def sensory_score_check
		score = gets.chomp.to_f
		until score != 0.0 && score % 0.25 == 0.0
			puts "Please enter your score using quarter-point format."
			score = gets.chomp.to_f
		end
		score
	end

	def defect_calculator
		defects = 0.0
		puts "Any defects?"
		defects_present = self.answer_check('y', 'n')
		if defects_present == 'y' 
			puts "Taint or fault?"
			defect_type = self.answer_check('t', 'f', ' for taint', ' for fault.')
			if defect_type == 't'
				defects += 2.0
			else
				defects += 4.0
			end
			puts "Number of cups in which defect was present? (1-3)"
			num_cups = gets.chomp.to_f
			until num_cups <= 3.0 && num_cups > 0.0
				puts "Please enter a valid number of cups"
				num_cups = gets.chomp.to_f
			end
			defects *= num_cups
		end
		defects
	end

	#variables
	SENSORY_CATEGORIES = 
	["fragrance/aroma", "flavor", "aftertaste", "acidity", "body", 
		"uniformity", "balance", "clean-cup", "sweetness", "overall"]
end