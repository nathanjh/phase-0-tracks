# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

"iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

"zom".insert(1, "o")
"zom".gsub("o", "oo")
"zom".sub("o", "oo")
# => “zoom”

"enhance".center("enhance".length + 8)
# => "    enhance    "

"Stop! You’re under arrest!".upcase
# => "STOP! YOU’RE UNDER ARREST!"

"the usual".concat(" suspects")
"suspects".prepend("the usual ")
#=> "the usual suspects"

"suspects".prepend("the usual ")
"the usual".concat(" suspects")
# => "the usual suspects"

"The case of the disappearing last letter".chomp("r")
"The case of the disappearing last letter".chop
# => "The case of the disappearing last lette"

"The mystery of the missing first letter".slice(1..39)
"The mystery of the missing first letter".sub("T", " ").lstrip
# => "he mystery of the missing first letter"

"Elementary,    my   dear        Watson!".squeeze(" ")
# => "Elementary, my dear Watson!"

"z".ord
# => 122 
# (What is the significance of the number 122 in relation to the character z?)
#  The number 122 represents the ordinal value (ie. the number representing the
#order in which the character appears in its set of encoded characters)--in this
#case, its Unicode number.

"How many times does the letter 'a' appear in this string?".count "a"
# => 4