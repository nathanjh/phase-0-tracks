class Puppy

	def initialize
		puts "Initializing new puppy instance..."
	end


	def fetch(toy)
		puts "I brought back the #{toy}!"
		toy
	end

	def speak(int)
		int.times { puts "woof" }
	end

	def roll_over
		puts "*rolls over*"
	end

	def dog_years(years)
		dog_years = years * 7
	end

	def shake
		puts "*extends paw*"
	end

end


class Dragons

	def initialize
		puts "Here comes a dragon..."
	end

	def breathes_fire
		puts "Breathes fire.  A lot."
	end

	def fly
		puts "Takes to the sky!"
	end
end









# fido = Puppy.new
# fido.fetch("frisbee")
# fido.speak(4)
# fido.roll_over
# p fido.dog_years(7)
# fido.shake

