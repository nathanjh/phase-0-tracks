#define Santa class
class Santa 
	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
	end

	#getter methods for attributes
	def reindeer_ranking
		@reindeer_ranking
	end

	def age
		@age
	end

	def ethnicity 
		@ethnicity
	end

	def gender
		@gender
	end

	#setter methods
	def gender=(new_gender)
		@gender = new_gender
	end

	#other instance methods
	def speak 
		p "Ho, ho, ho! Haaaappy holidays!"
	end

	def eat_milk_and_cookies(cookie)
		p "That was a good #{cookie}!"
	end

	def celibrate_birthday
		@age += 1
	end

	def get_mad_at(reindeer_name) #using slice method to rearrange array elements 
		@reindeer_ranking = @reindeer_ranking[0...@reindeer_ranking.index(reindeer_name)] + @reindeer_ranking[(@reindeer_ranking.index(reindeer_name) + 1)..(@reindeer_ranking.length - 1)] << @reindeer_ranking[@reindeer_ranking.index(reindeer_name)]
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

ethan = santas[45] #arbitrary santa from santas array!
p ethan.reindeer_ranking
#=> ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
ethan.get_mad_at("Prancer")
p ethan.reindeer_ranking
#=> ["Rudolph", "Dasher", "Dancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen", "Prancer"] 
ethan.celibrate_birthday
p ethan.age
#=> 1
ethan.gender = "gender fluid"
p ethan.gender
#=> "gender fluid"
p ethan.ethnicity
#=> "A. Indian/ Alaska nat."



