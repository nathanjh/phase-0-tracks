#release 1
# module Shout
# 	def self.yell_angrily(words)
# 		words + "!!!" + " >:("
# 	end

# 	def self.yell_happily(words)
# 		words + "!!!" + " :D"
# 	end
# end


# #release 1 driver code
# p Shout.yell_happily("I'm pretty happy")
# p Shout.yell_angrily("I'm quite angry")

#release 3

module Shout
	def yell_angrily(words)
		words + "!!!" + " >:("
	end

	def yell_happily(words)
		words + "!!!" + " :D"
	end
end

class Cabbie
	include Shout
end

class Isley_Brothers
	include Shout
end

rudolph = Isley_Brothers.new
puts rudolph.yell_happily("You know you make me wanna shout")
puts rudolph.yell_angrily("Come on, now")
travis = Cabbie.new
puts travis.yell_angrily("Hey pal, I'm drivin' here")
puts travis.yell_happily("You must be talking to me")