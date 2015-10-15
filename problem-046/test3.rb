#!/usr/bin/env ruby
$prime_hash = {2 => 0, 3 => 0}
$prime_array = [2,3]
$max_checked = 0

def is_prime(n)
	if n <= $max_checked
		return $prime_hash.has_key? n
	end
	$max_checked = n
	limit = n ** 0.5
	$prime_array.each do |p|
		if p > limit
			$prime_hash[n] = 0
			$prime_array.push n
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
	$prime_hash.has_key? n
end

t2 = Time.now
puts t2-t1

(3..100000).each do |n|
	is_prime(n)
end

t3 = Time.now
puts t3-t2