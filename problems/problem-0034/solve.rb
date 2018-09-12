#!/usr/bin/env ruby

# 145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.
#
# Find the sum of all numbers which are equal to the sum of the factorial of their digits.
#
# Note: as 1! = 1 and 2! = 2 are not sums they are not included.

$factorial_cache = {
	'0' => 1,
	'1' => 1,
	'2' => 2,
	'3' => 6,
	'4' => 24,
	'5' => 120,
	'6' => 720,
	'7' => 5040,
	'8' => 40320,
	'9' => 362880
}

def sum_of_factorial_digits(n)
	total = 0
	n.to_s.each_char do |c|
		total += $factorial_cache[c]
	end
	return total
end

total = 0
# The hard part is figuring the upper bound
# Looks like 7 x 9! < 99,999,999, which means that 7x9! is a practical upper... (that is the sum of factorial digits for the biggest 8-digit number is less than the #)
(10..2540160).each do |n|
	sum = sum_of_factorial_digits(n)
	if (n == sum)
		total += sum
		puts "#{n}: #{sum}"
	end
end

puts "Answer:#{total}"