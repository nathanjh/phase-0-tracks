module CoffeeUtilities

	#helper methods
	module_function
	
	#to add a user
	def create_user(db, name)	
		db.execute("INSERT INTO users (name) VALUES (?)", [name])
	end

	#to add a coffee
	def create_coffee(db, coffee, origin)
		db.execute("INSERT INTO coffees (name, origin) VALUES (?, ?)", [coffee, origin])
	end

	#to add a sample/batch                             
	def new_sample(db, coffee_id, roast_date)
		db.execute("INSERT INTO samples (coffee_id, roast_date) VALUES (?, ?)", [coffee_id, roast_date])
	end

	#to add a new sensory score (always blind tasting, so coffee not known)
	#scores is an array of floats/reals input by the user
	def score_sample(db, user_id, sample_id, coffee_id, sample_date, scores, notes, score_date)
		db.execute("INSERT INTO scores 
			(user_id, sample_id, coffee_id, sample_date, fragrance_aroma, flavor, 
			aftertaste, acidity, body, uniformity, balance, clean_cup, 
			sweetness, overall, defects, total_score, notes, score_date) 
			VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", 
			[user_id, sample_id, coffee_id, sample_date, scores[0], scores[1], scores[2], 
			scores[3], scores[4], scores[5], scores[6], scores[7], scores[8], 
			scores[9], scores[10], scores[11], notes, score_date])
	end

	#to get value from a corresponding row value--when given lookup_column, db, table, column
	def get_from_value(db, lookup_col, table, col, value)
		return_value = db.execute("SELECT #{lookup_col} FROM #{table} WHERE #{col} = '#{value}'")[0][lookup_col]
	end

	#logical test method for user data entry
	def in_db?(db, table, col, test_value)
		if test_value.class == String
			test = db.execute("SELECT * FROM #{table} WHERE #{col} = '#{test_value}'")
		else
			test = db.execute("SELECT * FROM #{table} WHERE #{col} = #{test_value}")
		end

		if test != []
			true
		else
			false
		end
	end

	def has_entries?(db, table)
		test = db.execute("SELECT id, COUNT(id) FROM #{table}")[0]['COUNT(id)']
		if test == 0
			false
		else
			true
		end
	end

	#to return index of most recent entry 
	def last_entry(db, table, col)
		last_entry = db.execute("SELECT MAX(#{col}) FROM #{table}")[0]["MAX(#{col})"]
	end



	#reports









	#variables 
	CREATE_COFFEES_TABLE = <<-SQL
		CREATE TABLE IF NOT EXISTS coffees(
			id INTEGER PRIMARY KEY,
			name VARCHAR(255),
			origin VARCHAR(255)
		)
	SQL

	CREATE_USERS_TABLE = <<-SQL
		CREATE TABLE IF NOT EXISTS users(
			id INTEGER PRIMARY KEY,
			name VARCHAR(255)
		)
	SQL

	CREATE_SAMPLES_TABLE = <<-SQL
		CREATE TABLE IF NOT EXISTS samples(
			id INTEGER PRIMARY KEY,
			coffee_id INT,
			roast_date TEXT,
			FOREIGN KEY(coffee_id) REFERENCES coffees(id)
		)
	SQL

	CREATE_SCORES_TABLE = <<-SQL
		CREATE TABLE IF NOT EXISTS scores(
			id INTEGER PRIMARY KEY,
			user_id INT,
			sample_id INT,
			coffee_id INT,
			sample_date TEXT,
			fragrance_aroma REAL,
			flavor REAL,
			aftertaste REAL,
			acidity REAL,
			body REAL,
			uniformity REAL,
			balance REAL,
			clean_cup REAL,
			sweetness REAL,
			overall REAL,
			defects REAL,
			total_score REAL,
			notes VARCHAR(255),
			score_date TEXT,
			FOREIGN KEY(user_id) REFERENCES users(id)
			FOREIGN KEY(sample_id) REFERENCES samples(id)
			FOREIGN KEY(coffee_id) REFERENCES coffees(id)
		)
	SQL



end