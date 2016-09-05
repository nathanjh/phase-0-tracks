module CoffeeUtilities

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
			FOREIGN KEY(user_id) REFERENCES users(id)
			FOREIGN KEY(sample_id) REFERENCES samples(id)
		)
	SQL
	


end