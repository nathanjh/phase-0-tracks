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