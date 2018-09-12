#!/usr/bin/env ruby

# Let d(n) be defined as the sum of proper divisors of n (numbers less than n which divide evenly into n).
# If d(a) = b and d(b) = a, where a ≠ b, then a and b are an amicable pair and each of a and b are called amicable numbers.
# 
# For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110; therefore d(220) = 284.
# The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.
#
# Evaluate the sum of all the amicable numbers under 10000.

def d(n)
	sum = 1
	(2..Math.sqrt(n)).each do |factor|
		if (n % factor == 0)
			sum += factor
			sum += n/factor
		end
	end
	return sum
end

values = Hash.new
(1..9999).each do |n|
	res = d(n)
	values[n]=res
	#puts "#{n}: #{res}"
end

puts "========"
total = 0
values.keys.each do |n|
	pair = values[n]
	if (pair > n && pair < values.size && values[pair] == n)
		puts "#{n}:#{pair}"
		total += n + pair
	end
end

puts "Total:#{total}"

