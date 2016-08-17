#define Santa class
class Santa 
	attr_reader :reindeer_ranking, :ethnicity
	attr_accessor :gender, :age

	def initialize(gender, ethnicity)
		@gender = gender
		@ethnicity = ethnicity
		@reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
		@age = 0
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


#driver code for release 0

# multiple_santa = Santa.new
# multiple_santa.speak
# multiple_santa.eat_milk_and_cookies("lusikkaleivat")

#driver code for release 1

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

#driver code for release 2

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

# random santa generator

#attribute printer helper method 
def attr_printer(santa) 
	puts "HO HO HO! Here comes a(n) #{santa.ethnicity} santa who identifies as #{santa.gender}.\nThis santa is #{santa.age} years young!"
end

#here comes a ton of random santas!
2000.times do |santa|
	# -initialize a new santa with randomized gender and ethnicity
	santa = Santa.new(gender_options.sample, ethnicity_options.sample)
	# -set age to a random number between 0 and 140
	santa.age = rand(140)
	# -print message displaying gender, ethnicity, and age using attr_accessor methods
	attr_printer(santa)
end



