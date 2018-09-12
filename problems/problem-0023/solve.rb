#!/usr/bin/env ruby

# A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
# For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
#
# A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
#
# As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as
# the sum of two abundant numbers is 24. By mathematical analysis, it can be shown that all integers greater
# than 28123 can be written as the sum of two abundant numbers. However, this upper limit cannot be reduced
# any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two
# abundant numbers is less than this limit.
#
# Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
#
# https://projecteuler.net/problem=23
#
# The first few abundant numbers are:
#   12, 18, 20, 24, 30, 36, 40, 42, 48, 54, 56, 60, 66, 70, 72, 78, 80, 84, 88, 90, 96, 100, 102, 104, 108, 112, 114, 120, …
#

def sum_of_divisors(n)
	sum = 1
	#print "#{n}:"
	(2..Math.sqrt(n)).each do |factor|
		if (n % factor == 0)
			sum += factor
			#print " #{factor}"
			if (factor != n/factor)
				sum += n/factor
				#print " #{n/factor}"
			end
		end
	end
	#puts ""
	return sum
end

abundant_numbers = Hash.new
#(10..1000).each do |n|
(1..28123).each do |n|
	if sum_of_divisors(n) > n
		# Silly... but I think Ruby hashes are much faster than arrays
		abundant_numbers[n] = 1
		#puts n
	end
end

puts "Found #{abundant_numbers.length} abundant numbers."

puts "========"
total = 0

# All the positive integers
(1..20161).each do |n|
	found = false
	x = 0
	y = 0
	abundant_numbers.keys.each do |m|
		if x/2 > n
			break
		end
		if abundant_numbers.has_key?(n-m)
			found = true
			x = m
			y = n-m
			break
		end
	end
	if found
		#puts "#{n}: #{x} + #{y}"
	else
		#puts "#{n}: none"
		total += n
	end
end


puts "Total:#{total}"

