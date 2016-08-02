# Method for Error Checking
def error_check(input_check)
	until input_check == "y" or input_check == "n" do 
		puts "Error. Please enter y or n"
		input_check = gets.chomp
	end
end

# Hamster Name
puts "Does this hamster have a name? (y/n)"
has_name = gets.chomp
error_check(has_name)

if has_name == "y"
	puts "What's this hamster's name?"
	name = gets.chomp
else has_name == "n"
	name = "Johnny"
end

# Hamster Loudness
puts "Rate hamster's loudness: (1-10)"
hamster_loudness = gets.chomp.to_i

# Hamster Color
puts "Rate hamster's fur color:"
hamster_color = gets.chomp

# Hamster a good pet?
puts "Would this hamster make a good pet? (y/n)"
good_pet = gets.chomp
error_check(good_pet)

# Hamster Age
puts "What do you reckon to be the age of this hamster (digit in years)? If not known, leave blank."
age = gets.chomp
if age == ""
	age = nil
else
	age = age.to_i
end

puts "Name: #{name}\nLoudness: #{hamster_loudness}\nColor: #{hamster_color}\nGood Candidate: #{good_pet}\nAge: #{age}\n"
