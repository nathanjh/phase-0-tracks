##add functionality to create and write to a list of all interviewees!!!!

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

#list of known vampire aliases
$vamp_names = ["Drake Cula", "Tu Fang", "O R Lok", "Angel"]
#vampire test helper method
def vamp_test(prof)
	results = "Results inconclusive."
	if $vamp_names.include?(prof[:name]) || prof[:allergies].include?("sunshine")
		results = "Definitely a vampire."
	elsif prof[:is_age] == false && prof[:likes_garlic] =="n" && prof[:wants_insurance] == "n"
		results = "Almost certainly a vampire."
	elsif prof[:is_age] == false && (prof[:likes_garlic] == "n" || prof[:wants_insurance] == "n")
		results = "Probably a vampire."	
	elsif prof[:is_age] != false && (prof[:likes_garlic] == "y" || prof[:wants_insurance] == "y")
		results = "Probably not a vampire."
	else
		results
	end
end			

#determine number of candidates to process
puts "Please input number of interviews to be processed."
times = gets.chomp.to_i
i = 0
while i < times
	#collect profile data in a hash
	prof = Hash.new 

	#name question
	puts "What is your name?\n"	
	prof[:name] = gets.chomp 

	#age questions
	puts "How old are you?\n"
	prof[:age] = gets.chomp.to_i
	puts "What year were you born?\n"
	prof[:birth_year] = gets.chomp.to_i
	prof[:is_age] = age_test(prof[:age], prof[:birth_year])

	#garlic question
	puts "Our company cafeteria serves garlic bread.\nShould we order some for you?(Y/N)\n"
	prof[:likes_garlic] = gets.chomp.downcase

	#insurance question
	puts "Would you like to enroll in the company's health insurance?(Y/N)\n"
	prof[:wants_insurance] = gets.chomp.downcase

	#allergy question
	prof[:allergies] = Array.new
	puts "Please list any known allergies.\nPlease type 'done' or leave blank when finished."
	allergy = gets.chomp
	until allergy == "" || allergy == "done"
		prof[:allergies] << allergy
		if allergy == "sunshine"
			break
		end
		allergy = gets.chomp
	end

	puts prof 
	outcome = vamp_test(prof)
	puts outcome
	i += 1
end
p "Actually, never mind! What do these questions have to do with anything? Let's all be friends."

