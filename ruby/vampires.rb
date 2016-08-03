#age test helper method
def age_test(age, birth_year)
	require 'date'
	test_age = Date.today.year - birth_year
	if test_age == age 
		return true 
	else 
		return false
	end
end

#name question
puts "What is your name?\n"	
name = gets.chomp 

#age questions
puts "How old are you?\n"
age = gets.chomp.to_i
puts "What year were you born?\n"
birth_year = gets.chomp.to_i

#garlic question
puts "Our company cafeteria serves garlic bread.\nShould we order some for you?(Y/N)\n"
likes_garlic = gets.chomp.downcase

#insurance question
puts "Would you like to enroll in the company's health insurance?(Y/N)\n"
wants_insurance = gets.chomp.downcase

prefs = [name, age, birth_year, likes_garlic, wants_insurance]


test_results = age_test(age, birth_year)
puts test_results
