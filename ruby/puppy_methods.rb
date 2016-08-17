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
		if years <= 2
			dog_years = years * 10.5
		else
			dog_years = 21 + (years - 2) * 4
		end
	end

	def shake
		puts "*extends paw*"
	end

end


class Dragon

	def initialize
		puts "Here comes a dragon..."
	end

	def breathes_fire
		"*breathes fire...a lot*"
	end

	def fly
		"Takes to the sky!"
	end
end

fifty_dragons = []
50.times { fifty_dragons << Dragon.new }
puts fifty_dragons

fifty_dragons.each do |dragon|
	puts "This dragon #{dragon.fly.downcase}\n#{dragon.breathes_fire}"
end





fido = Puppy.new
fido.fetch("frisbee")
fido.speak(4)
fido.roll_over
p fido.dog_years(7)
fido.shake

