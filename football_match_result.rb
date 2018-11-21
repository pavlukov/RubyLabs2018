# First task
goals_scored = [3, 0, 1, 2, 2, 1, 0, 0, 3, 4, 2, 1, 2, 3, 4, 0, 3, 5, 2, 1]
goals_missed = [2, 1, 1, 3, 5, 2, 0, 1, 0, 3, 2, 1, 0, 0, 1, 4, 3, 2, 3, 0]

match_results = []
until goals_scored.empty? 
	scored = goals_scored.shift
	missed = goals_missed.shift
	if scored > missed
		match_results.push("Победа")
	elsif scored < missed
		match_results.push("Поражение")
	else
		match_results.push("Ничья")
	end
end
	
puts match_results