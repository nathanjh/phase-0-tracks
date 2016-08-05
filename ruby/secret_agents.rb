#encrypt

#-takes a string as an argument
#-define encrypted string variable as empty string
#-if character is a letter, update new encypted string by advances by one forward in the alphabet
#-if character is a space,  add a space to new encrypted string



def encrypt_str(string)
	encrypted_str = ""
	i = 0
	while i < string.length
		if string[i] == " "
			encrypted_str += " "
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
	aplha = "abcdefghijklmnopqrstuvwxyz"
	i = 0
	while 1 < string.length
		if string[i] == " "
			decrypted_str += " "
		else 
			decrypted_str += alpha[alpha.index(string[i]) - 1]
		end
	end
	decrypted_str
end


