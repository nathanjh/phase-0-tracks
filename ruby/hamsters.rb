# Helper method for error checking
def error_check(input_check)
	until input_check == "y" or input_check == "n" do 
		puts "Error. Please enter y or n"
		input_check = gets.chomp
	end
end
# Hamster Name
puts "Does this hamster have a name? (y/n)"
name = gets.chomp
error_check(name)

if name == "y"
	puts "What's this hamster's name?"
	name = gets.chomp
else
	##Internal naming system based on number of un-named hamsters
	#combined with the name "Johhny".  Reads and writes from an external
	#file (along with date/time of entry, and parses as an array to determine
	#current "Johhny" number.
	require 'date'
	johnnys = File.open("johnnys.txt", "r") { |ham_names| 
		ham_names.readlines
	}
	name = "Johnny".concat(johnnys.length.to_s)
	File.open("johnnys.txt", "a") { |newname| newname.puts name + " acquired on: " +Time.now.strftime("%d/%m/%Y %H:%M")}
end

# Hamster Loudness
puts "Rate hamster's loudness: (1-10)"
hamster_loudness = gets.chomp.to_i
#test for valid response
until (1..10).include?(hamster_loudness)
	puts "Invalid loudness level\nPlease rate squeak volume on a scale from 1 to 10."
	hamster_loudness = gets.chomp.to_i
end

# Hamster Color
puts "Rate hamster's fur color:"
hamster_color = gets.chomp

# Hamster a good pet?
puts "Would this hamster make a good pet? (y/n)"
good_pet = gets.chomp
error_check(good_pet)

if good_pet == "y"
	good_pet = true
else
	good_pet = false
end

# Hamster Age
puts "What do you reckon to be the age of this hamster (digit in years)? If not known, leave blank."
age = gets.chomp
if age == ""
	age = nil
else
	age = age.to_i
	#test for valid response--takes advantage of zero return property of to_i method
	while age <= 0 #who knows? someone might use a negative number...
		puts "Please enter a valid age in years (eg. 1, 2, 3.75, etc.)."
		age = gets.chomp
		if age == ""
			age = nil
			break
		else
			age = age.to_i
		end
	end
end

puts "Name: #{name}\nLoudness: #{hamster_loudness}\nColor: #{hamster_color}\nGood Candidate: #{good_pet}\nAge: #{age == nil ? "age not known" : age} years old."
