# Nested data structure consisting largely of hashes within hashes to represent
#summer Olympics competition results (selected).

#helper function to convert time strings to seconds for comparison
def to_sec(time) #needs to be a string "min:sec.hundreths of a sec"
	time_ary = time.split(":").map { |num| num.to_f}#string to array of floats
	time_ary[0] = time_ary[0] * 60.0#convert min to sec
	time_in_sec = 0
	time_ary.each { |num| time_in_sec += num }#sum total number of seconds
	time_in_sec
end
#helper function to convert float back into formatted time string
#takes number of seconds as a float and outputs a string formatted min:sec.tenthshundreths
def to_time_string(seconds) 
	min = (seconds / 60).floor.to_s
	sec = (seconds % 60).round(3).to_s
	time_string = "#{min}:#{sec.match(/^\d\./) == nil ? sec : "0" + sec }"
	#conditional string formating to add zero 'padding' if needed
end

#helper function to sort times--returns a sorted array of times in sec, fastest to slowest
def sort_times(times) #takes an array of times as floats (in seconds )
	times_in_sec = times.map { |time| to_sec(time) }.sort 
end

#helper function to gather times into an array of strings--returns array of time-strings
def get_times(hash)
	times = hash.map { |name, time| time }
end

#helper function to convert hash times to seconds for comparison, returns new hash
def hash_in_sec(hash)
	hash_in_sec = hash
	hash_in_sec.each { |name, time| hash_in_sec[name] = to_sec(time) }
	hash_in_sec
end
#display method to compare sorted times array to a hash--takes hash (in seconds) and sorted array,
#and compares hash keys to array indices, and prints top three results and indicates medals won.

def ordered_results(hash, array)
	puts "Gold Medal: #{hash.key(array[0])} with a time of #{to_time_string(hash[hash.key(array[0])])}."
	puts "Silver Medal: #{hash.key(array[1])} with a time of #{to_time_string(hash[hash.key(array[1])])}."
	puts "Bronze Medal: #{hash.key(array[2])} with a time of #{to_time_string(hash[hash.key(array[2])])}."
end


#helper function to combine gymnastic scores for comparison
def total_score(scores) #scores needs to be an array of floats
	overall_score = 0
	scores.each { |num| overall_score += num}
	overall_score
end

# nested data structure:
summer_olympics = {
	2012 => {
		swimming: {
			mens_400m_im: {
				"Ryan Lochte" => "4:05.18",
				"Tiago Pereira" => "4:08.86",
				"Kosuke Hagino" => "4:08.94",
				"Michael Phelps" => "4:09.28",
				"Chad le Clos" => "4:12.42",
				"Yuya Horihata" => "4:13.49",
				"Thomas Fraser-Holmes" => "4:13.49",
				"Luca Marin" => "4:14.89",
				"World Record" => "4:03:84"
			},
			womens_400m_im: {
				"Ye Shiwen" => "4:28.43",
				"Elizabeth Beisel" => "4:31.27",
				"Li Xuanxu" => "4:32.91",
				"Katinka Hosszu" => "4:33.49",
				"Hannah Miley" => "4:34.17",
				"Stephanie Rice" => "4:35.49",
				"Caitlin Leverenz" => "4:35.49",
				"Mereia Belmonte Garcia" => "4:35.62",
				"World Record" => "4:26.43"
			}
		},
		gymnastics: {
			womens_all_around: {#top three only
				"Gabby Douglas" => [
					15.966, 15.733, 15.5, 15.033
				],
				"Viktoria Komova" => [
					15.466, 15.966, 15.441, 15.10
				],
				"Aliya Mustafina" => [
					15.233, 16.1, 13.633, 14.6
				]
			},
			mens_all_around: {
				"Kohei Uchimura" => [
					15.1, 15.066, 15.333, 16.266, 15.325, 15.6
				],
				"Marcel Nguyen" => [
					15.3, 13.666, 15.366, 15.666, 15.833, 15.2
				],
				"Danell Leyva" => [
					15.366, 13.5, 14.733, 15.566, 15.833, 15.7
				]
			}
		}

	},
	2016 => {
		swimming: {
			mens_400m_im: {
				"Kosuke Hagino" => "4:06.05",
				"Chase Kalisz" => "4:06.75",
				"Daiya Seto" => "4:09.71",
				"Max Lichfield" => "4:11.62",
				"Jay Litherland" => "4:11.68",
				"Thomas Fraser-Holmes" => "4:11.90",
				"Travis Mahoney" => "4:15.48",
				"Joan Lluis Pons" => "4:16.58",
				#"World Record" => ""
			},
			womens_400m_im: {
				"Katinka Hosszu" => "4:26.36",
				"Maya DiRado" => "4:31.15",
				"Mireia Belmonte" => "4:32.54",
				"Hannah Miley" => "4:32.54",
				"Emily Overhold" => "4:34.70",
				"Elizabeth Beisel" => "4:34.98",
				"Aimee Willmott" => "4:35.04",
				"Sakiko Shimizu" => "4:38.06",
				#"World Record" => ""
			}
		},
		gymnastics: {
			womens_all_around: {
				"Simone Biles" => [
					15.866, 14.966, 15.433, 15.933
				],
				"Aly Raisman" => [
					15.633, 14.166, 14.866, 15.433
				],
				"Aliya Mustafina" => [
					15.2, 15.666, 13.866, 13.933
				]

			},
			mens_all_around: {
				"Kohei Uchimura" => [
					15.766, 14.9, 14.733, 15.566, 15.6, 15.8
				],
				"Oleg Verniaiev" => [
					15.033, 15.533, 15.3, 15.5, 16.1, 14.8
				],
				"Max Whitlock" => [
					15.2, 15.875, 14.733, 15.133, 15, 14.7
				]
			}
		}

	}
}

#tests

womens_400m_im_2016 = summer_olympics[2016][:swimming][:womens_400m_im]
womens_400m_im_2012 = summer_olympics[2012][:swimming][:womens_400m_im]
# extract meaningful information from nested swimming data 
puts "In #{summer_olympics.keys[0]} summer Olympics, the results for the #{summer_olympics[2012][:swimming].keys[1]} are as follows:"
ordered_results(hash_in_sec(womens_400m_im_2012), get_times(womens_400m_im_2012))
puts "==================================================================="
puts "In #{summer_olympics.keys[1]} summer Olympics, the results for the #{summer_olympics[2016][:swimming].keys[1]} are as follows:"
ordered_results(hash_in_sec(womens_400m_im_2016), get_times(womens_400m_im_2016))
puts "======================================================================"
#extract meaningful information from nested gymnastics data
puts "The highest overall score in the men's individual all-around in #{summer_olympics.keys[0]} was:\n
#{summer_olympics[2012][:gymnastics][:mens_all_around].keys[0]} with a score of #{total_score(summer_olympics[2012][:gymnastics][:mens_all_around]["Kohei Uchimura"])}."
puts "====================================================================="
puts "The highest overall score in the men's individual all-around in #{summer_olympics.keys[1]} was:\n
#{summer_olympics[2016][:gymnastics][:mens_all_around].keys[0]} with a score of #{total_score(summer_olympics[2016][:gymnastics][:mens_all_around]["Kohei Uchimura"])}."
