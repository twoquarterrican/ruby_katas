Ruby Katas
==========

Bowling Game
------------

This kata was prepared for South Bend Software Craftsmanship meetup "Ruby Thursdays" May 2, 2013

http://www.meetup.com/sobesc/

#How to use
First, in the directory containing the Gemfile run `$ bundle install`.  In the directory containing the Guardfile, do `$ bundle exec guard` or `$ bundle exec guard -p` on Windows, even if running in a virtual machine.  For some reason, the automatic file change detection does not work otherwise.

Now guard will automatically run the tests in `bowling_game_kata/test/bowling_game_test.rb`

##Where to put your code

Tests go in `bowling_game_test.rb`.  There are tests there already. You can comment out or delete the tests if you want to start from scratch.

The code for the BowlingGame class is in several files.  Each is a solution or a partial solution

	bowling_game_kata/lib/
		bowling_game.rb
		bowling_game_meeting.rb
		bowling_game_no_ifs_or_loops.rb
		bowling_game_with_index.rb

`bowling_game.rb` is empty except for method definitions.  You can use this one as a skeleton.

`..meeting.rb` is the incomplete code from the May 2, 2013 ruby thursdays meetup

`..no_ifs_or_loops.rb` is a solution I wrote which uses no loops and no if statements

`..with_index.rb` is as solution I wrote which is the most straightforward solution I could think of.  The `score` method uses an `each_with_index `loop

Edit the variable `file` in `bowling_game_test.rb` to test different versions of the `BowlingGame` class.

#Inspirations
-Uncle Bob's bowling game kata:

http://www.butunclebob.com/ArticleS.UncleBob.TheBowlingGameKata
	
-A recursive search kata in ruby:

http://justintallant.com/ruby-kata-2-karate-chop/?doing_wp_cron=1366910988.3893599510192871093750
	
-A video of a roman numerals kata in ruby using rspec for testing

http://katas.softwarecraftsmanship.org/post/38470416869/roman-numerals-kata-with-corey-haines-this-is-the
	
-Template forked from github.com/jarhart/kata-template-ruby-testunit
