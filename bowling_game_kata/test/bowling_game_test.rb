require_relative 'test_helper'

file = 'meeting'

case file
when 'meeting'
	require 'bowling_game_meeting'
when 'no_loops'
	require 'bowling_game_no_ifs_or_loops'
when 'with_index'
	require 'bowling_game_with_index'
else
	require 'bowling_game'
end

class BowlingGameTest < Test::Unit::TestCase

	def setup
		@game = BowlingGame.new
	end

	def teardown
	end
	
	def test_all_gutters
		20.times {@game.roll 0}
		assert_equal(0, @game.score)
	end

	def  test_all_ones
		20.times {@game.roll 1}
		assert_equal(20, @game.score)	
	end
	
	 def test_all_strikes
		 12.times {@game.roll 10}
		assert_equal(300, @game.score)
	 end
	
	def test_two_strikes
		2.times {@game.roll 10}
		16.times {@game.roll 0}
		assert_equal(30, @game.score)
	end
	
	 def test_a_spare
		 roll_array([4,6,3])
		 17.times {@game.roll 0}
		 assert_equal(16, @game.score)
	 end

	 def test_not_really_a_spare
		 roll_array([2,4,6,3])
		 assert_equal(15, @game.score)
	 end

	 def test_a_strike_one_bonus
		 roll_array([10,4])
		 assert_equal(18, @game.score)
	 end

	 def test_a_strike_two_bonuses
		 roll_array([10,5,2])
		 assert_equal(24, @game.score)
	 end

	 def test_five_strikes
		 5.times {@game.roll 10}
		 assert_equal(30 + 30 + 30 + 20 + 10, @game.score)
	 end

	 def test_almost_perfect_game
		 (1..10).each do
			 @game.roll 10
		 end
		 @game.roll 4
		 @game.roll 6
		 @game.roll 1
		 assert_equal(270 + 2*4 + 6 + 1, @game.score)
	 end

	 def test_normal_game
		 [10,
			 3, 0,
			 4, 6,
			 9, 1 ,
			 5, 2,
			 4, 0,
			 0, 10,
			 5, 4,
			 3, 5,
			 10, 2].each do |pins|
			 @game.roll pins
		 end
		 assert_equal(10 + (3+0) +
									3 + 0 +
									4 + 6 + (9) + 
									9 + 1 + (5) +
									5 + 2 +
									4 + 0 +
									0 + 10 + (5) +
									5 + 4 +
									3 + 5 +
									10 + 2,
									@game.score)
	 end
	
	def roll_array arr
		arr.each do |pins|
			@game.roll pins
		end
	end

end
