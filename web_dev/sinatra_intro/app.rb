# require gems
require 'sinatra'
require 'sqlite3'

db = SQLite3::Database.new("students.db")
db.results_as_hash = true

# write a basic GET route
# add a query parameter
# GET /
get '/' do
  "#{params[:name]} is #{params[:age]} years old."
end

# write a GET route with
# route parameters
get '/about/:person' do
  person = params[:person]
  "#{person} is a programmer, and #{person} is learning Sinatra."
end

get '/:person_1/loves/:person_2' do
  "#{params[:person_1]} loves #{params[:person_2]}"
end

# write a GET route that retrieves
# all student data
get '/students' do
  students = db.execute("SELECT * FROM students")
  response = ""
  students.each do |student|
    response << "ID: #{student['id']}<br>"
    response << "Name: #{student['name']}<br>"
    response << "Age: #{student['age']}<br>"
    response << "Campus: #{student['campus']}<br><br>"
  end
  response
end

# write a GET route that retrieves
# a particular student

get '/students/:id' do
  student = db.execute("SELECT * FROM students WHERE id=?", [params[:id]])[0]
  student.to_s
end

#write a GET route that displays an address 
get '/contact' do 
  "<a href='http://www.opry.com'>2804 Opryland Dr, Nashville, TN 37214</a>"
end

#write a GET route that takes a name as a query parameter 
get '/great_job' do
  name = params[:name]
  if name
    "Good job, #{name}!"
  else
    "Good job!"
  end
end

#write a GET route that adds two numbers (as route parameters)
get '/:num_1/plus/:num_2' do 
  x = params[:num_1].to_f
  y = params[:num_2].to_f
  z = x + y 
  ans = z.to_s
  "#{params[:num_1].to_f.to_s} plus #{params[:num_2].to_f.to_s} equals #{ans}!"
end

#write a GET route that filters students by campus
get '/campus/:campus' do
  by_campus = db.execute("SELECT name FROM students WHERE campus=?", [params[:campus]])
  response = "students attending #{params[:campus]} campus:<br>"
  by_campus.each do |student|
    response << "#{student['name']}<br>"
  end
  response
end





