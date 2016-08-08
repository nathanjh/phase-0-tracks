#--Happier with this solution (see below for commented out alternate solution
#using in-line logic tests and updating variable based on answers given)

#Use questionaire to build up a hash to store answers, then apply a test method 
#to determine vampire status. This allows us to store interviewee profiles for 
#future reference (we could write hashes to a new file, or perhaps store them 
#locally by pushing to an array or another hash)
#-just for fun:
candidates = Hash.new

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

#list of known vampire aliases to test for
$vamp_names = ["Drake Cula", "Tu Fang", "O R Lok", "Angel"]

#vampire conditional logic test helper method
def vamp_test(prof)
	results = "Results inconclusive."
	if $vamp_names.include?(prof[:name])
		results = "Definitely a vampire."
	elsif prof[:is_age] == false && prof[:likes_garlic] =="n" && prof[:wants_insurance] == "n"
		results = "Almost certainly a vampire."
	elsif prof[:allergies].include?("sunshine") || (prof[:is_age] == false && (prof[:likes_garlic] == "n" || prof[:wants_insurance] == "n"))
		results = "Probably a vampire."	
	elsif prof[:is_age] != false && (prof[:likes_garlic] == "y" || prof[:wants_insurance] == "y")
		results = "Probably not a vampire."
	else
		results
	end
end			

#determine number of candidates to process
#note: user input could use error checking
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
	puts "Please list any known allergies.\nPlease type 'done' or leave blank (press enter) when finished."
	allergy = gets.chomp
	until allergy == "" || allergy == "done" #adds input to allergies array, unless "" or "done" or "sunshine" are input
		prof[:allergies] << allergy 
		if allergy == "sunshine"
			break
		end
		allergy = gets.chomp
	end
	#test answers
	outcome = vamp_test(prof)
	#store our test results 
	prof[:test_results] = outcome
	#update our candidate profiles hash to store data
	candidates[prof[:name].to_sym] = prof
	#print results for the user
	puts "Test results for #{prof[:name]}:\n" + outcome
	i += 1
end
#to test our hash storage method
puts "________________\nSummary of today's interviews:"
candidates.each do |k, v|
	puts "\n#{k} test results: #{v[:test_results]}"
end
puts ".\n.\n.\n.\n.\n.\n.\n.\n.\n.\nActually, never mind! What do these questions have to do with anything? Let's all be friends."


#alt solution using logic tests in line with questions (and doesn't store input data)

#determine number of candidates to process
#note: user input could use error checking
# puts "Please input number of interviews to be processed."
# times = gets.chomp.to_i
# i = 0
# while i < times
# 	#to store test results
# 	results = "Results inconclusive."

# 	#name question
# 	puts "What is your name?"	
# 	name = gets.chomp 

# 	#age questions
# 	puts "How old are you?"
# 	age = gets.chomp.to_i
# 	puts "What year were you born?"
# 	birth_year = gets.chomp.to_i
# 	is_age = age_test(age, birth_year)

# 	#garlic question
# 	puts "Our company cafeteria serves garlic bread.\nShould we order some for you?(Y/N)"
# 	likes_garlic = gets.chomp.downcase

# 	#insurance question
# 	puts "Would you like to enroll in the company's health insurance?(Y/N)"
# 	wants_insurance = gets.chomp.downcase

# 	#logic test for answers so far
# 	if $vamp_names.include?(name)
# 		results = "Definitely a vampire."
# 	elsif is_age == false && likes_garlic =="n" && wants_insurance == "n"
# 		results = "Almost certainly a vampire."
# 	elsif is_age == false && (likes_garlic == "n" || wants_insurance == "n")
# 		results = "Probably a vampire."	
# 	elsif is_age != false && (likes_garlic == "y" || wants_insurance == "y")
# 		results = "Probably not a vampire."
# 	else
# 		results
# 	end

# 	#allergy question--I don't particulary like this solution, as it seems illogical
#     #to short circut to a 'probably' even if a 'definitely' or 'almost certainly'
#     #has already been determined based on previous answers.  It would make more sense
#     #to only ask the allergy question if the result thus far evaluates to either 
#     #'probably', 'probably not', or 'inconclusive' results.  This logic is reflected
#     #in above solution.
# 	puts "Please list any known allergies.\nPlease type 'done' or leave blank (press enter) when finished."
# 	allergy = gets.chomp
# 	until allergy == "" || allergy == "done" 
# 		if allergy == "sunshine"
# 			results = "Probably a vampire."
# 			break
# 		end
# 		allergy = gets.chomp
# 	end

# 	#display test results
# 	puts "Test results for #{name}:\n" + results
# 	i += 1
# end
# puts ".\n.\n.\n.\n.\n.\n.\n.\n.\n.\nActually, never mind! What do these questions have to do with anything? Let's all be friends."

































