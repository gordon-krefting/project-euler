#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Permuted multiples
# Problem 52
#
# It can be seen that the number, 125874, and its double, 251748, contain exactly the same digits,
# but in a different order.
# 
# Find the smallest positive integer, x, such that 2x, 3x, 4x, 5x, and 6x, contain the same digits.
#
# ---------------------------------------------------------------------------------------------------------------------


# just tests if all array elements are permutations
def is_permuted(a)
	sorted_a = a.map { |n|
		n.to_s.split("").sort.join
	}.sort

	return sorted_a[0] == sorted_a[sorted_a.length - 1]
end

(1..6).each {|i|
	llimit = 10**i
	ulimit = (llimit * 1.67).to_i

	#puts "#{llimit}:#{ulimit}"

	(llimit..ulimit).each {|n|
		a = [n]
		(2..6).each {|multiplier|
			a.push n*multiplier
		}
		if is_permuted(a)
			puts a.join(",")
			exit
		end
	}
}
