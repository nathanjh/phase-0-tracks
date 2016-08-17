module Shout
	def self.yell_angrily(words)
		words + "!!!" + " >:("
	end

	def self.yell_happily(words)
		words + "!!!" + " :D"
	end
end


#release 1 driver code
p Shout.yell_happily("I'm pretty happy")
p Shout.yell_angrily("I'm quite angry")
