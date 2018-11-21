# Tenth task
class FootballMatch
	def initialize(goals_scored, goals_missed)
		@scored = goals_scored
		@missed = goals_missed
	end 

	def print_match_result
		print("#{@scored}:#{@missed} ")
		if @scored > @missed
			puts "Победа"
		elsif @scored < @missed
			puts "Поражение"
		else
			puts "Ничья"
		end
	end
end

goals_scored = [3, 0, 1, 2, 2, 1, 0, 0, 3, 4, 2, 1, 2, 3, 4, 0, 3, 5, 2, 1]
goals_missed = [2, 1, 1, 3, 5, 2, 0, 1, 0, 3, 2, 1, 0, 0, 1, 4, 3, 2, 3, 0]

until goals_scored.count == 0
	football_match = FootballMatch.new(goals_scored.shift, goals_missed.shift).print_match_result
end
