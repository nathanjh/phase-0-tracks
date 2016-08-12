def method
	puts "I'm the method"
	yield("block")
	puts "And I'm a method again"
end

method { |block| puts "I'm a block" }

puts ""

states = ["California", "Florida", "Washington", "New York", "Georgia"]

states_and_capitals = { CA: "Sacramento", FL: "Tallahassee", WA: "Olympia", NY: "Albany", GA: "Atlanta"}

p states
p states_and_capitals

#each
states.each do |state|
	puts state
end

states_and_capitals.each do |state, capital|
	puts "The capital of #{state} is #{capital}."
end

p states
p states_and_capitals

#map!
states.map! do |state|
	puts state
	state.reverse
end

#.map on hash
# new_states_and_capitals = states_and_capitals.map do |state, capital|
# 	state.to_s.reverse
# end

p states
# p new_states_and_capitals


# Release 2

# 1
#array (array#delete_if modifies array in place)
ary = [1, 34, 2, 6, 90, 134, 28, 33, 87]
ary.delete_if { |num| num.even?}
p ary
#hash  (hash#delete_if modifies hash in place)
hash = {"nathan" => 35, "bradley" => 19, "anton" => 3}
hash.delete_if { |name, age| name.length > 5 }
p hash

# 2
#array (array#keep-if modifies array in place)
ary = [1, 34, 2, 6, 90, 134, 28, 33, 87]
ary.keep_if { |num| num.even?}
p ary
#hash  (hash#keep-if modifies hash in place)
hash = {"nathan" => 35, "bradley" => 19, "anton" => 3}
hash.keep_if { |name, age| name.length > 5 }
p hash

# 3 
#array (array#select returns new array)
ary = [1, 34, 2, 6, 90, 134, 28, 33, 87]
even_ary = ary.select { |num| num.even?}
p even_ary
#hash  (hash#select returns new hash)
hash = {"nathan" => 35, "bradley" => 19, "anton" => 3}
hash.select { |name, age| name.length > 5 }
p hash

# 4
#array (array#drop_while returns new array)
ary = [1, 34, 2, 6, 90, 134, 28, 33, 87]
under_one_hundred = ary.drop_while { |num| num < 100 }
p under_one_hundred
#hash (hash#reject! modifies hash in place)
hash = {"nathan" => 35, "bradley" => 19, "anton" => 3, "bob" => 29, "jane" => 5}
hash.reject! { |name, age| name.length > 5 }
p hash




















