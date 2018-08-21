#!/usr/bin/env ruby
#
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once.
# For example, 2143 is a 4-digit pandigital and is also prime.
#
# What is the largest n-digit pandigital prime that exists?
#
#--------------------------------------------------------------------------------------------
# We're going to work through permutations backwards from 987654321... the largest pandigital number.
# 
# For each, we'll check if it's prime. We'll use a list of primes < sqrt(987654321) to help check.
#
# If we don't find a 9 digit one, we'll try 8, etc.
#--------------------------------------------------------------------------------------------
# Turns out 9 and 8 digit pandigital primes don't work:
#  1+2+3+4+5+6+7+8+9 = 45 (divisible by 3)
#  1+2+3+4+5+6+7+8 = 36 (divisible by 3)
# not entirely sure why this matters, but it means we can start at 7 digits
# 

# Found a nice sieve implementation at http://rosettacode.org/wiki/Sieve_of_Eratosthenes#Ruby
def eratosthenes(n)
  nums = [nil, nil, *2..n]
  (2..Math.sqrt(n)).each do |i|
    (i**2..n).step(i){|m| nums[m] = nil}  if nums[i]
  end
  nums.compact
end

$primes = eratosthenes(Math.sqrt(7654321))

def is_prime(n)
	limit = Math.sqrt(n)
	$primes.each do |p|
		if n % p == 0
			return false
		end
		if p > limit
			return true
		end
	end
	return false
end

# From http://trevoke.net/blog/2008/12/20/lexicographic-permutations-in-ruby/
# (I should try to understand this better)
def permutations array
  if array.size < 2
    yield array
  else
    array.each do |element|
      permutations(array.select() {|n| n != element}) \
      {|val| yield([element].concat val)}
    end
  end
end

#puts is_prime(17)
#puts is_prime(100050001)

permutations([7,6,5,4,3,2,1]) do |a|
	i = a.join.to_i
	if is_prime(i)
		puts i
		break
	end
end









