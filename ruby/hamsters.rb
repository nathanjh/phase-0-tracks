# Method for Error Checking
def error_check(input_check)
	until input_check == "y" or input_check == "n" do 
		puts "Error. Please enter y or n"
		input_check = gets.chomp
	end
end
# Hamster Name
puts "Does this hamster have a name? (y/n)\n"
name = gets.chomp
error_check(name)

if name == "y"
	puts "What's this hamster's name?\n"
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
puts "Rate hamster's loudness: (1-10)\n"
hamster_loudness = gets.chomp.to_i

# Hamster Color
puts "Rate hamster's fur color:"
hamster_color = gets.chomp

# Hamster a good pet?
puts "Would this hamster make a good pet? (y/n)\n"
good_pet = gets.chomp
error_check(good_pet)

if good_pet == "y"
	good_pet = true
else
	good_pet = false
end

# Hamster Age
puts "What do you reckon to be the age of this hamster (digit in years)? If not known, leave blank.\n"
age = gets.chomp
if age == ""
	age = nil
else
	age = age.to_i
end

puts "Name: #{name}\nLoudness: #{hamster_loudness}\nColor: #{hamster_color}\nGood Candidate: #{good_pet}\nAge: #{age}\n"
