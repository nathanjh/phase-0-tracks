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
	name = "Johnny"
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
