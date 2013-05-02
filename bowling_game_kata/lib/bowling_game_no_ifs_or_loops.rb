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
		@ball = @ball + 1 + @strike_bonuses.last
	end

	def score
		@strike_bonuses[-1] = 0
		numRolls = @rolls.count-1
		m = Matrix[
			Array.new(numRolls, 1), 
			@spare_bonuses[1..numRolls],
			@strike_bonuses[1..numRolls]
		]
		r = Matrix.column_vector(@rolls[1..numRolls])
		(Matrix[[1,1,1]]*m*r)[0,0]
	end
	
	private

	def compute_bonuses
		@strike_bonuses << strike_bonus
		@spare_bonuses << 
			(@ball % 2)*(1-@ball/18)*
				(@rolls[-2] + @rolls[-1])/10 + @strike_bonuses.last
	end

	def strike_bonus
		(1 - @ball % 2)*(@rolls[-1]/10)*(1 - @ball/18)
	end
	
end
