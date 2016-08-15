#alias method pseudocode:
#-build up new string of shifted letters by mapping new array of shifted letters, and join into a string
#-conditionally shift letters:
#   -test if letter is a 'letter' character or not
#   	-if not, leave as is in new aliased string
#   	-if so, test whether or not character is a vowel
#          -if so, shift one to the right on list of vowels
#		   -if not, shift one to the right on list of consonants
##-reverse first and last names: 
#   -convert string to array by splitting on the space
#   -reverse name positions in array (new 'reversed' array)
#   -join the new array back into a string 

#next vowel -returns character shifted one to the right on vowels list
def next_vowel(char)
	vowels = "aeiouAEIOU"
	if char == "u" 
		new_char = "a"
	elsif char == "U"
		new_char = "A"
	else
		new_char = vowels[vowels.index(char) + 1]
	end
end

#next consonant -returns character shifted one to the right on consonant list
def next_cons(char)
	consonants = "bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ"
	if char == "z"
		new_char = "b"
	elsif char == "Z"
		new_char = "B"
	else 
		new_char = consonants[consonants.index(char) + 1]
	end
end

#vowel? returns boolean value to test whether a character is a vowel
def is_vowel(char)
	"aeiouAEIOU".include? char
end

#punctuation returns boolean value to test whether a character is a space or one of .,:;!?@#$"'
def is_non_letter(char)
	" .,:;!?@#\$\"'1234567890".include? char
end

#letter shifter - conditional implementation of above methods to shift vowels and consonants
def letter_shifter(string)
	string.chars.map do |char|#recall that string#each_char also iterates over each char in a string w/o the ary conversion!
		if is_non_letter(char)
			char
		elsif is_vowel(char)
			next_vowel(char)
		else
			next_cons(char)
		end
	end.join("")
end

# order switch - takes a string, reverses word order, returns reversed string 
def last_first(string)
	string.split(" ").reverse.join(" ")
end

#encode -encoding method that combines helper methods to process string to encrypted string
def encode(name)
	code_name = last_first(letter_shifter(name))
end