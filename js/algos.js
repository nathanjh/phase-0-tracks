//Release 0: Longest Phrase
//pseudocode for longest string function: 
//(if more than one string tied for longest, returns the first string encountered)
//	-Input is an array of strings
//  -Declare an empty string variable to store strings for comparrison
//  -For each string in input array
//		-IF length of string is longer than string stored in comparrison 
//		string variable:
//			-overwrite comparrison string with new string
//		-ELSE check next string in input array
//	-Return comparrison string variable

function longestString(array) { 
	var word = "";
	for (var i = 0; i < array.length; i++) {
		if (array[i].length > word.length) {
			word = array[i];
		}
	}
	return word;
}

// //driver code (Release 0)
// var phrases = ["long phrase","longest phrase","longer phrase"];
// var longestPhrase = longestString(phrases);
// console.log(longestPhrase);
// //=> "longest phrase"
// var words = ["and", "or", "the", "kettle", "coffee"];
// var longestWord = longestString(words);
// console.log(longestWord);
// //=> "kettle" (first encountered longest word)

//Release 1:
//pseudocode for key-value match function:
//	-Input is two js objects (object1 and object2)
//	-Declare a variable to hold boolean return value to prevent function 
//	short-circuting with an early return statement.
//	-For each key in object1
//		-IF object2 has the key
//			-Compare the values at object1 key and object2 key
//			-IF value of object1 key is equal to object2 key:
//				-Set boolean variable equal to true
//		-ELSE set boolean variable equal to false
//	-Return boolean variable
