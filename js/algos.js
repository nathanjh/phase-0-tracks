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
//	short-circuting with an early return statement, and set it to equal false.
//	-For each key in object1
//		-IF object2 has the key
//			-Compare the values at object1 key and object2 key
//			-IF value of object1 key is equal to object2 key:
//				-Set boolean variable equal to true
//		-ELSE set boolean variable equal to false
//	-Return boolean variable

function pairCheck(obj1, obj2) {
	var isEqual = false;
	for (var key in obj1) {
		if (key in obj2) {
			if (obj1[key] == obj2[key]) {
				isEqual = true; //will return true if at least one k,v pair is shared
			}
		}
	}
	return isEqual;
}

// //driver code (Release 1)
// var dog = {
// 	name: "Teddy",
// 	age: 10,
// 	color: "golden"
// };
// var cat = {
// 	name: "Fearless",
// 	color: "grey and brown",
// 	age: 10
// };
// hasMatch = pairCheck(cat, dog);
// console.log(hasMatch);
// //=> true (objects share age key and value)
// var otherCat = {
// 	color: "white and grey",
// 	name: "Oliver",
// 	age: 5
// };
// hasMatch = pairCheck(cat, otherCat);
// console.log(hasMatch);
// //=> false (objects share all keys but no values)
// var chair = {
// 	material: "wood",
// 	legs: 4
// };
// hasMatch = pairCheck(dog, chair);
// console.log(hasMatch);
// //=> false (no shared keys or values)

//Release 2:
//pseudocode for random words array function:
//	-Input is an integer to indicate output array length (i.e. number of words)
//	-Create a local array variable to store random words
//	-Input-integer number of times:
//		-Add a random word to local array variable
//		-Random Words function:
//			-Input is an integer to indicate length of nonsensical word-string.
//			-Create a local empty string variable to store our word as it is built.
//			-Input-integer number of times:
//				-Select a random letter (using random letter function, defined below)
//				-Add letter to word string variable 
//			-Output random word 
//	-Return array 

//random letter helper function
function randomLetter() {
	var alpha = "abcdefghijklmnopqrstuvwxyz";
	return alpha[Math.floor(Math.random() * 26) ];
}
//random vowel helper function--to make our words more aesthetically interesting
function randomVowel() {
	var vowels = "aeiou";
	return vowels[Math.floor(Math.random() * 5) ];
}
//vowel check helper function--to help our random word function know when to select a vowel
function isVowel(char) {
	var vowels = "aeiou"; 
	if (vowels.includes(char)) {
		return true;
	}
}
//random word helper function 
//(added some conditional letter selection to try and make slightly more interesting words)
function randomWord(strLength) {
	var word = ""
	word += randomLetter() //to base subsequent letter selection off of random first letter
	for (var i = 0; i < strLength - 1; i++) {
		if (isVowel(word[i])) { 
			if (Math.random() < 0.1) { //approximate a 1 in 10 chance?
				word += randomVowel();
			} else word += randomLetter();
		} else {
			word += randomVowel();
		}
	}
	return word;
}
//random words array function
function randomWordsArray(aryLength) {
	var ary = [];
	for (var i = 0; i < aryLength; i++) {
		ary.push(randomWord(Math.floor((Math.random() * 10) + 1)));//makes words between 1 and 10 letters long
	}
	return ary; 
}

//to test (as per Release 2):
for (var i = 0; i < 10; i++) {
	var array = randomWordsArray(Math.floor((Math.random() * 10) + 1));
	console.log(array);
	var word = longestString(array);
	console.log(word);
}


