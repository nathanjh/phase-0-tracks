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

db = SQLite3::Database.new("coffee_grading.db")
db.results_as_hash = true

tables = [CoffeeUtilities::CREATE_COFFEES_TABLE, CoffeeUtilities::CREATE_USERS_TABLE, 
	CoffeeUtilities::CREATE_SAMPLES_TABLE, CoffeeUtilities::CREATE_SCORES_TABLE]
tables.each do |table|
	db.execute(table)
end

#CoffeeUtilities.create_user(db, "Chris")
#db.execute("INSERT INTO users (name) VALUES ('Nathan')")

test = CoffeeUtilities.is_in?(db, 'users', 'name', 'Jonathan')
p test


