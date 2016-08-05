#encrypt

#-takes a string as an argument
#-define encrypted string variable as empty string
#-if character is a letter, update new encypted string by advances by one forward in the alphabet
#-if character is the letter 'z', update new encrypted string with 'a'
#-if character is a space,  add a space to new encrypted string



def encrypt_str(string)
	encrypted_str = ""
	i = 0
	while i < string.length
		if string[i] == " "
			encrypted_str += " "
		elsif string[i] == "z"
			encrypted_str += "a"
		else
			encrypted_str += string[i].next
		end
		i += 1
	end
	encrypted_str
end

#decrypt

#-takes an encrypted string as an argument
#-define decrypted string variable as empty string
#-define alpha variable as string containing the alphabet to get index numbers
#-if character is a letter, finds the letter before the chosen letter, and update decrypted string variable
#-if character is a space, add a space to decrypted string variable

def decrypt_str(string)
	decrypted_str = ""
	alpha = "abcdefghijklmnopqrstuvwxyz"
	i = 0
	while i < string.length
		if string[i] == " "
			decrypted_str += " "
		else 
			decrypted_str += alpha[alpha.index(string[i]) - 1]
		end
		i += 1
	end
	decrypted_str
end

#this nested method call works because the encrypt method returns the string shifted 1 letter forward
#the decrypt method takes the shifted string as its argument and returns a string shifted back 1 letter
#p decrypt_str(encrypt_str("swordfish"))

# Add an Interface 
#-ask user decrypt or encrypt a password
puts "Would you like to decrypt(d) or encrypt(e) password?"
#-get user input 
user_choice = gets.chomp
#-ask user for password
puts "What would you like your password to be?\nWords only, please."
#-get user input and store as a variable
user_password = gets.chomp
#-either encrypt or decrypt based on previous choice and print results to the screen
if user_choice == "d"
	puts "Your decrypted password is:" + decrypt_str(user_password)
else
	puts "Your encrypted password is:" + encrypt_str(user_password)
end
#-exit program













