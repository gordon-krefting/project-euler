#!/usr/bin/env ruby

# Quadratic primes
# Problem 27
#
# Euler discovered the remarkable quadratic formula:
# 
#                   n² + n + 41
# 
# It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
# However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41, and certainly when
# n = 41, 41² + 41 + 41 is clearly divisible by 41.
# 
# The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes for the
# consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.
# 
# Considering quadratics of the form:
# 
#                   n² + an + b, where |a| < 1000 and |b| < 1000
# 
#     where |n| is the modulus/absolute value of n
#     e.g. |11| = 11 and |−4| = 4
#
# Find the product of the coefficients, a and b, for the quadratic expression that produces the maximum
# number of primes for consecutive values of n, starting with n = 0.
# -----------------------------------------------------------------------------------------------------

require_relative "../lib/sieve.rb"
require_relative "../lib/incrementor.rb"

init_primes(150000)

max_count = 0
winning_a = -1000
winning_b = -1000

(-999..999).each do |a|
	(-999..999).each do |b|
		count = 0
		incrementor(0) do |n|
			f = n**2 + a*n + b
			if !is_prime(f)
				if count > max_count
					max_count = count
					winning_a = a
					winning_b = b
				end
				break
			else
				count += 1
			end
			#puts f
		end
	end
end

puts "a:#{winning_a}, b:#{winning_b}: #{max_count}"
puts winning_a * winning_b
