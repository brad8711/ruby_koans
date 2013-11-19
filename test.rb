def score(dice)
 #dice should always be an array
 raise Exception, "parameter must be an array" if dice.class != Array
  #more any other amount of dice other than what we've checked for
  	#lets count the duplicates and uniques
  	score_hash = Hash.new(0)
  	dice.each do |value|
	  score_hash[value] += 1
	end
	total_score = 0 #storage for the accumulated score
	score_hash.each do |key, value|
		if key == 1 && value < 3
			total_score += (key * 100) * value
		elsif key == 1 && value == 3
			total_score += 1000
		elsif key == 1 && value > 3
			score_to_add = 0
        	remaining_to_score = value - 3
        	score_to_add += 1000
        	score_to_add += (remaining_to_score * 100)
        	total_score += score_to_add
		elsif key == 5 && value < 3
			total_score += (key * 10) * value
		elsif key == 5 && value > 3
			score_to_add = 0
        	remaining_to_score = dice.size - 3
        	score_to_add += (key * 100)
        	score_to_add += (remaining_to_score * 50)
        	total_score += score_to_add
        elsif value == 3
			total_score += (key * 100)
		else
			total_score += 0
		end
	end
	return total_score
end
#p "should be 300 -> #{score([1,5,5,1])}"
#p "should be 550 -> #{score([5,5,5,5])}"
#p "should be 1100 -> #{score([1,1,1,1])}"
p "should be 1150 -> #{score([1,1,1,5,1])}"