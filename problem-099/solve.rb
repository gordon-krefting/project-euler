#!/usr/bin/env ruby
#
# Largest exponential
# Problem 99
#
# Comparing two numbers written in index form like 2^11 and 3^7 is not difficult, as any calculator would confirm that 2^11 = 2048 < 3^7 = 2187.
#
# However, confirming that 632382^518061 > 519432^525806 would be much more difficult, as both numbers contain over three million digits.
#
# Using base_exp.txt (right click and 'Save Link/Target As...'), a 22K text file containing one thousand lines
# with a base/exponent pair on each line, determine which line number has the greatest numerical value.
#
# NOTE: The first two lines in the file represent the numbers in the example given above.
# ---------------------------------------------------------------------------------------------------
#

pairs = Array.new
File.readlines('in.txt').each do |line|
	pairs.push line.strip.split(/,/).collect{|s| s.to_i}
end

max_value = 0.0
max_index = -1
(0..pairs.length-1).each do |i|
	log_value = pairs[i][1] * Math.log(pairs[i][0])
	if (log_value > max_value)
		max_index = i
		max_value = log_value
	end
	#puts "#{pairs[i][0]}^#{pairs[i][1]}"
end

puts "Line: #{max_index+1}"