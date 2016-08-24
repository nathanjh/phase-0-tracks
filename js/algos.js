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

//driver code
var phrases = ["long phrase","longest phrase","longer phrase"];
var longestPhrase = longestString(phrases);
console.log(longestPhrase);
//=> "longest phrase"
var words = ["and", "or", "the", "kettle", "coffee"];
var longestWord = longestString(words);
console.log(longestWord);
//=> "kettle" (first encountered longest word)
