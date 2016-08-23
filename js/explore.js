//Function to return reversed string
//	-The input for this function will be a string
//  -Declare an emplty string variable to hold our reversed string as it is built
//  -Declare a counter variable to count backwards from the last character in input string
//  	-Set counter variable equal to last character index of input string 
//			-This will be the length of input string minus one
//	-For each character in the string
//		-Add character to reversed string variable
//			-Character at input string index is equal to counter
//		-Decrement counter by one while counter is greater than or equal to zero.
//	-Output reversed string variable

function revString(string) {
	revStr = "";
	for (i = string.length - 1; i >= 0; i--) {
		revStr += string[i];
	}
	return revStr;
}

console.log(revString("reverse me"))
