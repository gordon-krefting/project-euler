#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Prime pair sets
# Problem 60
#
# The primes 3, 7, 109, and 673, are quite remarkable. By taking any two primes and concatenating them in any order
# the result will always be prime. For example, taking 7 and 109, both 7109 and 1097 are prime. The sum of these four
# primes, 792, represents the lowest sum for a set of four primes with this property.
# 
# Find the lowest sum for a set of five primes for which any two primes concatenate to produce another prime.
#
# ---------------------------------------------------------------------------------------------------------------------
#
# The right answer is 26033
#
# This algorithm is super-ugly and too slow (>5 min). Not sure how to speed it up... seems like we're doing the
# minimum number of comparisions. Perhaps not using strings for figuring is_remarkable?
# 
# Even if it's faster... looks like O(n^2). Ick.
#
require_relative "../lib/primes"
require "set"

$primes = Primes.new(5000)

$pairs_cache = Set.new
$bad_pairs_cache = Set.new

def is_remarkable_pair(pair)
	if $pairs_cache.include? pair
		return true
	end
	if $bad_pairs_cache.include? pair
		return false
	end
	if pair[0] == pair[1]
		return false
	end

	s1 = pair[0].to_s + pair[1].to_s
	s2 = pair[1].to_s + pair[0].to_s
	remarkable = $primes.is_prime(s1.to_i) && $primes.is_prime(s2.to_i)
	if remarkable
		$pairs_cache.add pair
	else
		$bad_pairs_cache.add pair
	end
	return remarkable
end

puts "-"
(1..999999).each do |i|
	is_remarkable_pair [i,i]
end
puts "-"
(1..999999).each do |i|
	is_remarkable_pair [i,i]
end
exit






def is_remarkable_set(set)
	return set.combination(2).all? {|pair| is_remarkable_pair(pair)}
end

#puts is_remarkable_pair([2,3])
#puts is_remarkable_pair([2,3])
#puts is_remarkable_pair([3,7])
#puts is_remarkable_pair([3,7])

#puts is_remarkable_set([3,7,109])
#puts is_remarkable_set([3,7,109,673])

sets_of_two = []

$primes.primes.combination(2).each do |pair|
	#if is_remarkable_pair pair
	#	sets_of_two.push pair
	#end
end
puts "Number of sets of two: #{sets_of_two.size}"
puts "Number of primes checked: #{$primes.primes.length}"

exit

sets_of_three = []
$primes.primes.each do |p|
	sets_of_two.each do |set|
		triple = [p] + set
		#puts triple.inspect
		if is_remarkable_set triple
			sets_of_three.push triple.sort
		end
	end
end

sets_of_three.uniq!

puts "Number of sets of three: #{sets_of_three.size}"

sets_of_four = []
$primes.primes.each do |p|
	sets_of_three.each do |set|
		quad = [p] + set
		#puts triple.inspect
		if is_remarkable_set quad
			sets_of_four.push quad.sort
		end
	end
end

sets_of_four.uniq!

puts "Number of sets of four: #{sets_of_four.size}"


sets_of_five = []
$primes.primes.each do |p|
	sets_of_four.each do |set|
		pent = [p] + set
		if is_remarkable_set pent
			sets_of_five.push pent.sort
		end
	end
end

sets_of_five.uniq!

puts "Number of sets of five: #{sets_of_five.size}"

sets_of_five.each do |set|
	puts set.inspect
end





