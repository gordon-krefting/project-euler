#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Powerful digit sum
# Problem 56
# A googol (10^100) is a massive number: one followed by one-hundred zeros; 100^100 is almost unimaginably large:
#   one followed by two-hundred zeros. Despite their size, the sum of the digits in each number is only 1.
# 
# Considering natural numbers of the form, a^b, where a, b < 100, what is the maximum digital sum?
#
# ---------------------------------------------------------------------------------------------------------------------

max = 0

(1..99).each do |a|
	(1..99).each do |b|
		#puts "#{a}^#{b}"
		#puts a**b
		digit_sum = (a**b).to_s.split("").map{|c| c.to_i}.reduce(:+)
		if digit_sum > max
			max = digit_sum
		end
	end
end

puts max