require_relative 'test_helper'
require 'bowling_game'

class BowlingGameTest < Test::Unit::TestCase

	def setup
		@game = BowlingGame.new
	end

	def teardown
	end
	
	def test_all_gutters
		(1..20).each do
			@game.roll 0
		end
		assert_equal(0, @game.score)
	end

	def test_all_ones
		(1..20).each do
			@game.roll 1
		end
		assert_equal(20, @game.score)
	end

	def test_a_spare
		@game.roll 9
		@game.roll 1
		@game.roll 6
		assert_equal(22, @game.score)
	end

	def test_not_really_a_spare
		@game.roll 2
		@game.roll 4
		@game.roll 6
		@game.roll 3
		assert_equal(15, @game.score)
	end

	def test_a_strike_one_bonus
		@game.roll 10
		@game.roll 4
		assert_equal(18, @game.score)
	end

	def test_a_strike_two_bonuses
		@game.roll 10
		@game.roll 5
		@game.roll 2
		assert_equal(24, @game.score)
	end

	def test_five_strikes
		(1..5).each do
			@game.roll 10
		end
		assert_equal(30 + 30 + 30 + 20 + 10, @game.score)
	end

	def test_perfect_game
		(1..12).each do
			@game.roll 10
		end
		assert_equal(300, @game.score)
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

end
