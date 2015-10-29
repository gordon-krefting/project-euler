# ---------------------------------------------------------------------------------------------------------------------
# Primes
#
# ---------------------------------------------------------------------------------------------------------------------

class Primes
	attr_accessor :primes
	
	def initialize(size)
		@primes = [nil, nil, *2..size]
  		(2..Math.sqrt(size)).each do |i|
    		(i**2..size).step(i){|m| @primes[m] = nil}  if @primes[i]
  		end
		@primes.compact!
	end

	def is_prime(n)
		if n < 2
			return false
		end
		limit = Math.sqrt(n)
		@primes.each do |p|
			if n % p == 0
				return false
			end
			if p > limit
				return true
			end
		end
		return false
	end

	def prime_factors(n, a = [])
		if is_prime(n)
			a.push n
			return a
		end
		@primes.each do |p|
			if n % p == 0
				a.push p
				prime_factors(n / p, a)
				break
			end
		end
		return a
	end
end