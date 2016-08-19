#Release 0
# Rhythmic Pattern class:
# 	
# creates a simple (as opposed to compound) rhythm cycle object that has:
# - a certain number of beats per cycle (int)
# - two writable (as a two element array of strings) accents on any number of beats per cycle 
#   (default is high and low pitched sounds)
# - writable 'instrument'(named by a string) on which to play pattern (default is 'woodblock') 
# - array defining placement of accents (if any) within the rhythmic cycle
#   	-stored as an array of integers with value options:
# 			0 => no accent, 1 => accent at zero index of accent sounds array, 
#			2 => accent at index one of accent sounds array
# An instance of this class...
# - can be 'played' by a play method which prints accent array to the console @ 60 bpm and 
#  	references the instrument attribute as 'playing'
#		-takes an argument (int) to indicate number of repetitions (plays through pattern once if
# 		 left blank) 
# - can create a retrograde version of itself by returning a new instance created with a reversed 
# 	accent array.
# - can create an inverted version of itself by returning a new instance created with an array 
# 	that swaps accent types 1 for 2 whenever they occur.
#  ** note that the retrograde and inversion methods can be chained to create a 'mirror image' 
# - a print method that prints to the console and returns a string representing the rhythmic pattern

#Release 1

class RhythmicPattern
	attr_reader :beats_per_cycle, :accents_array
	attr_accessor :accent_sounds, :instrument #possible to edit sounds and instrument


	def initialize(accents_array)
		@beats_per_cycle = accents_array.length
		@accents_array = accents_array #would like to make this a more logical interface...feels clunky
		@accent_sounds = ["High Pitch", "Low Pitch"]
		@instrument = 'woodblocks'
	end
	
	def play(times=1) #to "play" rhytmic pattern in the console
 		puts "Playing on #{@instrument}..."
		while times > 0
			beat_counter = 1
			@accents_array.each do |beat|
				if beat == 0
					puts beat_counter
				elsif beat == 1
					puts @accent_sounds[0]
				elsif beat == 2
					puts @accent_sounds[1]
				end
				beat_counter += 1
				sleep 1
			end
			times -= 1
		end
	end

	def retrograde 
		retro_rhythm = @accents_array.reverse 
		retrograde = RhythmicPattern.new(retro_rhythm)
	end

	def inversion
		invers_rhythm = @accents_array.map do |event|
			if event == 0
				event
			elsif event == 1
				2
			elsif event == 2
				1
			end
		end
		inversion = RhythmicPattern.new(invers_rhythm)
	end
	
	def print_pattern
		printed_pattern = "Rhythmic cycle of #{@beats_per_cycle} beats:\n-----------------------------\n"
		beat_counter = 1
		@accents_array.each do |beat|
			if beat == 0
				printed_pattern += "/#{beat_counter}"
			elsif beat == 1
				printed_pattern += "/#{@accent_sounds[0]}"
			elsif beat == 2
				printed_pattern += "/#{@accent_sounds[1]}"
			end
			beat_counter += 1
		end
		puts printed_pattern += "/\n-----------------------------\n(played on #{@instrument})"
		printed_pattern
	end

end

#Release 2



#user input accent-beat-choice conversion helper method
def to_accents(string_of_nums) #takes a string of user input numbers 
	accents = string_of_nums.split(" ").map { |num| num.to_i }
end

#user input accent-beat-choice validity checker method
def beat_is_ok(num_beats, beat) #takes beat number as int and checks it against a given number of beats
	if beat <= num_beats
		true
	else
		false
	end
end
#helper method to add user input array of numbers to accent pattern array
# 	-takes an array of user input beat numbers and uses them to modify accents array by updating
# 	accents array at user input index to equal val (an int) 
def accent_adder(pattern_ary, accents, val) 
	accents.each do |accent|
		if accent <= pattern_ary.length
			pattern_ary[accent - 1] = val
		end
	end
	pattern_ary
end
			

#UI

patterns = [] #to store user created patterns
puts "Hi there! Would you like to compose a simple rhythmic pattern? (y/n)"
ans = gets.chomp.downcase
until ans == "n" || ans == ""
	puts "Great! How many beats would you like your pattern to be? (whole number please)"
	num_beats = gets.chomp.to_i
	while num_beats == nil 
		puts "Please enter a valid number"
		num_beats = gets.chomp.to_i
	end
	pattern_ary = Array.new(num_beats, 0) #to start to build up our array argument for ::new
	puts "You've created a cycle of #{num_beats}!\nLet's add some accents..."
	puts "On what beats (if any) would you like a strong accent?\n(You may enter as many as #{num_beats} or leave blank to skip.)"
	puts "Please separate numbers with spaces."
	strong_accents = to_accents(gets.chomp)
	while strong_accents.length > num_beats
		puts "More accents than beats available, please try again..."
		strong_accents = to_accents(gets.chomp)
	end
	unless strong_accents == []
		accent_adder(pattern_ary, strong_accents, 1)
	end
	puts "We have strong accents on beats #{strong_accents.join(", ")}. Would you like any weak accents?"
	puts "(You may enter as many as #{num_beats} or leave blank to skip.)\nPlease separate numbers with spaces."
	weak_accents = to_accents(gets.chomp)
	while weak_accents.length > num_beats
		puts "More accents than beats available, please try again..."
		weak_accents = to_accents(gets.chomp)
	end
	unless weak_accents == []
		accent_adder(pattern_ary, weak_accents, 2)
	end
	patterns << RhythmicPattern.new(pattern_ary)
	puts "Here's your rhythm:"
	patterns.last.print_pattern
	puts "You're welcome to change the instrument or sounds used to play your pattern...\nplease select i (for instrument) or s (for sounds) or leave blank to skip!"
	choice = gets.chomp.downcase
	if choice == "i"
		puts "Please enter a new instrument to play your pattern...anything you'd like!"
		patterns.last.instrument = gets.chomp
	elsif choice == "p"
		puts "Please enter some new sounds for your accents!"
		puts "New strong accent: (leave blank to skip)"
		new_strong_choice = gets.chomp
		unless new_strong_choice == ""
			patterns.last.accent_sounds[0] = gets.chomp
		end
		puts "New weak accent: (leave blank to skip)"
		new_weak_choice = gets.chomp
		unless new_weak_choice == ""
			patterns.last.accent_sounds[1] = gets.chomp
		end
	end
	puts "To confirm, your pattern: "
	patterns.last.print_pattern
	puts "Would you like to compose another rhythmic pattern?\nWe could chain them together to compose a piece of music!(y/n)"
	ans = gets.chomp.downcase
end
puts "Just for fun, would you like to 'hear' your composition? (y/n)"
play = gets.chomp.downcase
if play == "y"
	patterns.each { |pattern| pattern.play }
else
	puts "Thank you!"
end

patterns.each { |pattern| pattern.print_pattern }






















# three_plus_two = RhythmicPattern.new([1, 0, 0, 2, 0])
# three_plus_two.print_pattern
# p three_plus_two.instrument
# p three_plus_two.beats_per_cycle
# three_plus_two.accent_sounds = ["Chick", "Chhhh"]
# three_plus_two.instrument = "Hi-Hats"
# three_plus_two.print_pattern
# three_plus_two.play(2)
# three_plus_two.retrograde.play(2)
# three_plus_two.inversion.play(2)
# three_plus_two.retrograde.inversion.play(2)