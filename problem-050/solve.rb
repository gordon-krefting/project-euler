#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Consecutive prime sum
# Problem 50
# The prime 41, can be written as the sum of six consecutive primes:
# 
# 41 = 2 + 3 + 5 + 7 + 11 + 13
# This is the longest sum of consecutive primes that adds to a prime below one-hundred.
# 
# The longest sum of consecutive primes below one-thousand that adds to a prime, contains 21 terms, and is equal to 953.
# 
# Which prime, below one-million, can be written as the sum of the most consecutive primes?
#
# ---------------------------------------------------------------------------------------------------------------------
require_relative "../lib/primes"

limit = 1000000

p = Primes.new(limit)

max_streak = 0
the_prime = 2

(1..p.primes.length-1).each do |i|
	n = p.primes[i]
	sum = 0
	(i..p.primes.length-1).each do |j|
		sum += p.primes[j]
		if p.is_prime(sum)
			streak = j - i + 1
			if streak > max_streak
				max_streak = streak
				the_prime = sum
			end
			if streak > 1
				puts "   #{sum}: #{streak}"
			end
		end
		if sum > limit
			break
		end
	end
	#puts n
end

puts "#{the_prime}: Streak:#{max_streak}"

