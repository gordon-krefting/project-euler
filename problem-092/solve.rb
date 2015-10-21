#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Square digit chains
# Problem 92
# A number chain is created by continuously adding the square of the digits in a number to form
# a new number until it has been seen before.
# 
# For example,
# 
# 44 → 32 → 13 → 10 → 1 → 1
# 85 → 89 → 145 → 42 → 20 → 4 → 16 → 37 → 58 → 89
# 
# Therefore any chain that arrives at 1 or 89 will become stuck in an endless loop.
# What is most amazing is that EVERY starting number will eventually arrive at 1 or 89.
# 
# How many starting numbers below ten million will arrive at 89?
#
# ---------------------------------------------------------------------------------------------------------------------
#
require "set"

$s89 = Set.new([89])
$s1  = Set.new([1])

def sum_of_squared_digits(n)
	sum = 0
	n.to_s.each_char do |c|
		sum += c.to_i ** 2
	end
	return sum
end

def do_chain(n, chain = Array.new)
	#puts n
	if n <= 729
		if $s89.include? n
			$s89.merge chain
			return true
		end
		if $s1.include? n
			$s1.merge chain
			return false
		end
		chain.push n	
	end
	return do_chain(sum_of_squared_digits(n), chain)
end


count = 0
(1..99999).each do |n|
	if do_chain(n)
		count += 1
	end
end

puts "Count:#{count}"

exit

#(1..9999999)
(1..999999).each do |n|
	sum_of_squared_digits(9999999)
end
exit




