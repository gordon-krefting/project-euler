#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Champernowne's constant
# Problem 40
# An irrational decimal fraction is created by concatenating the positive integers:
# 
# 0.123456789101112131415161718192021...
# 
# It can be seen that the 12th digit of the fractional part is 1.
# 
# If dn represents the nth digit of the fractional part, find the value of the following expression.
# 
# d1 × d10 × d100 × d1000 × d10000 × d100000 × d1000000
#
# ---------------------------------------------------------------------------------------------------------------------
# Ugh in Ruby Math.log(1000) != 3, it equals 2.99999996, hence the horrible fudge (+ 0.01) in length calc

require_relative "../lib/incrementor.rb"
require_relative "../lib/util.rb"

overall_length = 0
checkpoints = [1,10,100,1000,10000,100000,1000000]
checkpoint_index = 0
n = checkpoints[checkpoint_index]

product = 1

Incrementor.new(1).each do |i|
	length_i = Math.log(i+0.01,10).to_i + 1
	# found one
	if n > overall_length && n <= overall_length + length_i
		index = n - overall_length
		c = nth_digit(i, index)
		product = product * c
		checkpoint_index += 1
		# all done
		if checkpoint_index >= checkpoints.length
			break
		end
		n = checkpoints[checkpoint_index]
	end
	overall_length += length_i
end

puts product