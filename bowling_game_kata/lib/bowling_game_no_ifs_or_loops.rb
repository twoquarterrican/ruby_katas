require 'matrix'

class BowlingGame

	def initialize
		@rolls = [0]
		@spare_bonuses = [0,0]
		@strike_bonuses = [0,0,0]
		@ball = 0
	end

	def roll pins
		@rolls << pins
		compute_bonuses
		@ball += 1 + @strike_bonuses.last
	end

	def score
		numRolls = @rolls.count-1
		b = bonus_matrix numRolls
		r = roll_matrix numRolls
		sm = score_matrix(b, r)
		sm[0,0]
	end
	
	private

	def bonus_matrix n
		Matrix[Array.new(n,1), @spare_bonuses[1..n], @strike_bonuses[1..n]]
	end

	def roll_matrix n
		Matrix.column_vector(@rolls[1..n])
	end

	def score_matrix bonus, rolls
		Matrix[[1,1,1]]*bonus*rolls
	end

	def compute_bonuses
		@strike_bonuses << strike_bonus
		@spare_bonuses <<
			second_ball_of_frame * not_last_frame * last_two_rolls_ten +
			@strike_bonuses.last
	end

	def strike_bonus
		first_ball_of_frame  * not_last_frame * last_roll_ten
	end

	def first_ball_of_frame
		1 - second_ball_of_frame
	end

	def second_ball_of_frame
		@ball % 2
	end

	def not_last_frame
		1 - @ball/18
	end

	def last_roll_ten
		@rolls[-1]/10
	end

	def last_two_rolls_ten
		(@rolls[-1] + @rolls[-2])/10
	end

end
