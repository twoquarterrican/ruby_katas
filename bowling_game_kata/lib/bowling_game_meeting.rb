class BowlingGame

	MAX_PINS_PER_FRAME = 10

	def initialize

		@frames = []
		@currentFrame = []
	end

	def roll pins
		if @currentFrame.count == 2
			@frames << @currentFrame
			@currentFrame = []
		end
		@currentFrame << pins
	end

	def score
		s = 0
		a = @frames + @currentFrame
		a.each_with_index do |frame, index|
			s += frame_score @frames[index..index+2]
		end
		s
	end
	
	private
	
	def frame_score frame_arr
		if strike? frame_arr.first
			sum frame_arr[1] + 
			(strike?(frame_arr[1]) ? 
			frame_arr.last.first : 0)
		else
			sum frame_arr.first
		end
	end
	
	def strike? frame
		frame.count == 1 and sum (frame) == 10
	end
	
	def sum frame
		frame.inject(:+)
	end
	
end
