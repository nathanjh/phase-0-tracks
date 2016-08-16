#define Santa class
class Santa 
	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	def speak 
		p "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie}!"
	end

	
	
end



# multiple_santa = Santa.new
# multiple_santa.speak
# multiple_santa.eat_milk_and_cookies("lusikkaleivat")


#array to store santa objects
santas = []

gender_options = ["agender", "androgyne", "androgynous", "bigender", "cis", "cisgender", "cis female", "cis male", "FTM", 
"gender fluid", "gender nonconforming", "genderqueer", "intersex", "male", "female", "N/A"]
ethnicity_options = ["white", "black", "A. Indian/ Alaska nat.", "Asian", "Latino", "Hawaiian n."]

#here's a bunch of santas...96 in all...
ethnicity_options.length.times do |x| #outer loop for each possible ethnicity
	gender_options.length.times do |y| #inner loop for each possible gender id
		santas << Santa.new(gender_options[y], ethnicity_options[x])
	end
end



