#!/usr/bin/env ruby

# The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove
# digits from left to right, and remain prime at each stage:
#
#       3797, 797, 97, and 7
#
# Similarly we can work from right to left:
#
#       3797, 379, 37, and 3
#
# Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
#
# NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
# ---------------------------------------------------------------------------------------------------
#
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
def truncate_left(n)
	return n % 10 ** Math.log(n, 10).floor
end

def truncate_right(n)
	return n / 10
end

def check_left(n)
	if n < 10
		return is_prime(n)
	else
		return is_prime(n) && check_left(truncate_left(n))
	end
end

def check_right(n)
	if n < 10
		return is_prime(n)
	else
		return is_prime(n) && check_right(truncate_right(n))
	end
end

def is_truncatable_prime(n)
	if (!is_prime(n))
		return false
	end
	if (n < 10)
		return false
	end
	return check_left(n) && check_right(n)
end

total = 0
(3..999999).each do |n|
	if is_truncatable_prime(n)
		total += n
	end
end

puts "Total: #{total}"

