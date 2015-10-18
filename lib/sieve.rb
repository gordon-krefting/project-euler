# Found a nice sieve implementation at http://rosettacode.org/wiki/Sieve_of_Eratosthenes#Ruby
def eratosthenes(n)
  nums = [nil, nil, *2..n]
  (2..Math.sqrt(n)).each do |i|
    (i**2..n).step(i){|m| nums[m] = nil}  if nums[i]
  end
  nums.compact
end

#$primes = eratosthenes(Math.sqrt(7654321))
$primes

def init_primes(n)
	$primes = eratosthenes(n)
end

def is_prime(n)
	if n < 2
		return false
	end
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