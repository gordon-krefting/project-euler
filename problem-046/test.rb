#!/usr/bin/env ruby
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

t0 = Time.now

(3..100000).each do |n|
	is_prime(n)
end

t1 = Time.now
puts t1-t0

(3..100000).each do |n|
	$primes.include? n
end

t2 = Time.now
puts t2-t1