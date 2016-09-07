#create and maintain database of sensory scores for sample batches of coffee

#should be easy to input scores, sample batch info, coffee info, and user profiles

#should be able to produce meaningful reports about coffee evaluations by retrieving
#stored data by:
#averaging scores
#selecting based on a discreet sample batch, a coffee, a user, a time period

#will be comprised of: 
#   a ui where user can:
#      -create user profile
#      -input batch information
#      -add new coffees  
#      -input sensory scores 
#      -generate reports
#   a module to be required that will contain all helper methods
#   a database with four tables (users, coffees, batches/samples, scores)

#UI
#require sqlite3, helper methods module
#create or open database
#create (if not already extant) tables
#get user input
#modify tables 
#generate reports (optional)
#quit

#Helper methods module
	#user creation method
	#coffee creation method
	#sample input method
	#score input method
	#reports methods

require 'sqlite3'
require_relative 'coffee_utilities'
require_relative 'coffee_ui'

db = SQLite3::Database.new("coffee_grading.db")
db.results_as_hash = true

tables = [CoffeeUtilities::CREATE_COFFEES_TABLE, CoffeeUtilities::CREATE_USERS_TABLE, 
	CoffeeUtilities::CREATE_SAMPLES_TABLE, CoffeeUtilities::CREATE_SCORES_TABLE]

tables.each { |table| db.execute(table) }


#CoffeeUtilities.create_user(db, "Chris")
#db.execute("INSERT INTO users (name) VALUES ('Nathan')")
# CoffeeUtilities.create_coffee(db, "Las Flores", "Honduras")
# CoffeeUtilities.create_coffee(db, "Copo Mico", "Honduras")
# test = db.execute("SELECT id FROM coffees WHERE name = 'Copo Mico'")[0]['id']
# p test
# puts test.class
#CoffeeUtilities.new_sample(db, "Copo Mico", "2016-09-03")
# test = CoffeeUtilities.get_id_from_name(db, 'coffees', 'Copo Mico')
# p test
#scores = [9.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.0, 9.5, 9.0, 9.0, 2.0, 88]
#CoffeeUtilities.score_sample(db, 1, 0, "2016-09-05", scores, "baggy but delicious")

#welcome to coffee grader!
#get user name
puts "COFFEE GRADER".center(50, '#'), "\nUser name:"
user = gets.chomp
while user == ""
	puts "Please enter a user name."
	user =gets.chomp
end

#test name, if not exists, create new user
if  CoffeeUtilities.in_db?(db, 'users', 'name', user) == false
	CoffeeUtilities.create_user(db, user)
	puts "Welcome, #{user}!"
else	
	puts "Nice to see you again, #{user}!"
end

running = true

while running
	#print menu to screen, get selection
	#   -menu has 1.score coffee(s), 2. new sample/batch, 3. new coffee, 4. reports 5. exit
	puts "MAIN MENU".center(50, '-'), " [1] Score Coffee".ljust(30) << "[2] Add Sample/Roast"
	puts " [3] Add Coffee".ljust(30) << "[4] Reports", " [5] Exit"
	puts '-' * 50
	puts "please select a number:"

	user_choice = gets.chomp.to_i
	while user_choice == "" || user_choice == 0 || user_choice > 5
		puts "please enter a valid selection based on the above menu numbers:"
		user_choice = gets.chomp.to_i	
	end

	#case statement to handle user input (use to_i method return to test input validity)
	case user_choice
	when 1
	when 2
		adding_sample = true
		while adding_sample
			puts "Let's add a sample for cupping.\n""Please enter a roast date in the format YYYY-MM-DD:"
			roast_date = gets.chomp
			until roast_date.length == 10
				puts "Please use the format YYYY-MM-DD"
				roast_date = gets.chomp 
			end
			puts "A great day! Please enter coffee name (capitalization matters!):"
			coffee_name = gets.chomp
			while !CoffeeUtilities.in_db?(db, 'coffees', 'name', coffee_name)
				puts "I'm not familiar with that coffee.", "Would you like to add it?"
				add_choice = CoffeeUi.answer_check('y', 'n')
				if add_choice == 'y'
					puts "Please enter an origin:"
					coffee_origin = gets.chomp
					CoffeeUtilities.create_coffee(db, coffee_name, coffee_origin)
					puts "Added #{coffee_name}, #{coffee_origin} and..."
				else
					puts "Try again?"
					try_again = CoffeeUi.answer_check('y', 'n', ' to try again', ' for main menu')
					if try_again == 'n'
						adding_sample = false
						break #TODO fix this so that we exit to main menu!
					else
						puts "Please enter coffee name:"
						coffee_name = gets.chomp
					end
				end
			end 
			CoffeeUtilities.new_sample(db, CoffeeUtilities.get_id_from_name(db, 'coffees', coffee_name), roast_date)
			puts "Added new sample of #{coffee_name}, roasted on #{roast_date}.\n"
			puts "Again?"
			sample_again = CoffeeUi.answer_check('y', 'n', ' to add another sample', ' for main menu')
			if sample_again == 'n'
				adding_sample = false
			end
		end
	when 3
	when 4
	else
		puts "Thanks for using...goodbye!" 
		running = false
	end
end


