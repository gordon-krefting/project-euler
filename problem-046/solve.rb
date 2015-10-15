#!/usr/bin/env ruby

# Goldbach's other conjecture
# Problem 46
# It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
#
#   9 = 7 + 2 × 1^2
#   15 = 7 + 2 × 2^2
#   21 = 3 + 2 × 3^2
#   25 = 7 + 2 × 3^2
#   27 = 19 + 2 × 2^2
#   33 = 31 + 2 × 1^2
#
# It turns out that the conjecture was false.
#
# What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?
# ---------------------------------------------------------------------------------------------------
# Note: this solution builds up the prime list as it's checking the conjecture... so we've got to
# start searching at 3
#
$primes = [2,3]

def is_prime(n)
	limit = n ** 0.5
	$primes.each do |p|
		if p > limit
			$primes.push n
			return true
		end
		if n % p == 0
			return false
		end
	end
end

def conjecture(n)
	limit = n ** 0.5
	(1..limit).each do |i|
		rem = n - 2 * i**2
		if $primes.include? rem
			#puts "#{n} = #{rem} + 2 x #{i}^2"
			return true
		end
	end
	return false
end

(5..100001).step(2) do |n|
	if (!is_prime(n))
		if (!conjecture(n))
			puts "#{n}"
			exit
		end
	end
end

puts "Didn't find it"
