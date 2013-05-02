class BowlingGame

	MAX_PINS_PER_FRAME = 10

	def initialize
		@rolls = []
	end

	def roll pins
		@rolls << pins
	end

	def score
		total_score = 0
		slot = 0
		bonus = [0,0]
		@rolls.each_with_index do |pins, roll|
			total_score += pins*(1 + bonus[0])
			bonus, slot = compute_bonus_and_slot slot, roll, bonus
		end
		total_score
	end

	private

	def compute_bonus_and_slot slot, roll, bonus
		if strike? slot, roll
			bonus = [bonus[1] + 1, 1]
			slot += 1
		elsif spare? slot, roll
			bonus = [bonus[1] + 1, 0]
		else
			bonus = [bonus[1], 0]
		end
		slot += 1
		return [bonus, slot]
	end

	def strike? slot, roll
		slot % 2 == 0 and @rolls[roll] == MAX_PINS_PER_FRAME and slot < 18
	end

	def spare? slot, roll
		slot % 2 == 1 and @rolls[roll-1] + @rolls[roll] == MAX_PINS_PER_FRAME and slot < 18
	end

end
