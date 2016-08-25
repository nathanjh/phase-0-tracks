# Virus Predictor

# I worked on this challenge [by myself, with: Robbie S].
# We spent [1.5ish] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative is referring to the module/class requirement for the code to run 
#
# require_relative 'state_data'
# require './state_data.rb'

class VirusPredictor
  
  def self.generate_report(states)#taking an argument makes this method more flexible (in this case, it expects a hash of hashes)
    states.each do |state, data| #key is state, data is value as a hash 
      VirusPredictor.new(state, data).virus_effects
    end
  end

  # Initializes the class with the three requested variables from the data set into the viruspredictor class 
  def initialize(state_of_origin, data)#when taking hash values as parameters, better to use 'data' as parameter and use [] notation to get specific values 
    @state = state_of_origin
    @population = data[:population]
    @population_density = data[:population_density]
  end


  # Wrapping two methods while passing the arguments from the dataset
  def virus_effects
    predicted_deaths#(@population_density, @population, @state)
    speed_of_spread#(@population_density, @state)
  end

  private
  #private attr_reader methods let private methods access actual 
  attr_reader :population_density, :population, :state
  
  # Prints out a result of predicted deaths based off of the data passed through the conditional statements 
  def predicted_deaths#(population_density, population, state)
    # predicted deaths is solely based on population density
    # if population_density >= 200
    #   number_of_deaths = (population * 0.4).floor
    # elsif population_density >= 150
    #   number_of_deaths = (population * 0.3).floor
    # elsif population_density >= 100
    #   number_of_deaths = (population * 0.2).floor
    # elsif population_density >= 50
    #   number_of_deaths = (population * 0.1).floor
    # else
    #   number_of_deaths = (population * 0.05).floor
    # end
    pop_percentage = 0.0
    density_test = 50
    if population_density >= 50
      while population_density >= density_test do 
        pop_percentage += 0.1
        density_test += 50
      end
        number_of_deaths = (population * pop_percentage).floor
    else
        number_of_deaths = (population * 0.05).floor
    end
        print "#{state} will lose #{number_of_deaths} people in this outbreak"
  end
  # predicted_deaths refactoring:
  #  -input density integer, population integer
  #  -define percentage multiplier, set it equal to 0
  #  -define density test variable, set it equal to 50 (because if less than 50)
  #  -IF population density is greater than or equal to 50
  #   -test population density (ASSUMPTION: as population density increments by 50, number of deaths (in percentage of population) increments by 10%)
  #    -while population density is greater than test variable increment test variable by 50 and multiplier by .1, retest
  #  -calculate num deaths with incremented multiplier
  #  -ELSE calculate num deaths with 5% 
  #  -return and print string  

  # Prints out a result of speed_of_spread using two different variables from the data set 
  def speed_of_spread#(population_density, state) #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    speed = 0.0

    if population_density >= 200
      speed += 0.5
    elsif population_density >= 150
      speed += 1
    elsif population_density >= 100
      speed += 1.5
    elsif population_density >= 50
      speed += 2
    else
      speed += 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

VirusPredictor.generate_report(STATE_DATA)

# DRIVER CODE
 # initialize VirusPredictor for each state

#all states report
#  -input is a hash of states and state data
#  -for each state
#    -instantiate a new viruspredictor class
#    -call virus effects method

# STATE_DATA.each do |state, data|
#   VirusPredictor.new(state, data[:population_density], data[:population]).virus_effects
# end




# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects



#=======================================================================
# Reflection Section
#1. The state_data file uses both 'hash rocket' notation to declare values for string keys
#(applies to all non-symbol data types that can be valid keys) and symbol notation to declare 
#values for symbol keys.

#2. require_relative is used when the file to be loaded is in the same or a closely related directory
#as the file in which it's being loaded--in other words, the file is loaded relative to the requiring 
#file's path.  require needs to specify an absolute path, or needs to be located in the $LOAD_PATH 
#global variable object.

#3. We can iterate over a hash by calling the #each method to iterate over key/value pairs.
#We can also call the #each_key or #each_value methods to iterate over just values or keys.

#4. The variables were instance variables, and therefore were automatically accessable 
#by the instance methods passing them in as arguments (which was unnecessarry)...a question
#of scope.

#5. It was extremely helpful to work with my pair and guide to really dig into refactoring!
#I now have a deeper understanding of when to use class methods.  I learned about a better 
#approach to passing hashes as method parameters (especially initialize methods where a hash can
#be used to get values for instance variables!).  I also solidified my concept for when/how
#to use the private method to make methods private within a class definition...as well
#as some cool tricks for how to save time by implicity testing private methods when testing
#public methods, and declaring private reader/writer methods. 











