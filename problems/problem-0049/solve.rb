#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Prime permutations
# Problem 49
# The arithmetic sequence, 1487, 4817, 8147, in which each of the terms increases by 3330, is unusual in two ways:
#   (i) each of the three terms are prime, and,
#   (ii) each of the 4-digit numbers are permutations of one another.
# 
# There are no arithmetic sequences made up of three 1-, 2-, or 3-digit primes, exhibiting this property,
# but there is one other 4-digit increasing sequence.
# 
# What 12-digit number do you form by concatenating the three terms in this sequence?
#
# ---------------------------------------------------------------------------------------------------------------------
require_relative "../lib/primes"
require_relative "../lib/util"
require "set"

prime = Primes.new(10000)

checked = Set.new

prime.primes.each do |p|
	a = p.to_s
	if (a.length != 4) || (checked.include? p)
		next
	end

	terms = a.split("").permutation.map{|term|
		term.join.to_i}.uniq.sort.select {|term|
		# permutations that start with 0 don't count
		term >= 1000
	}.select{|term|
		# gotta be prime
		prime.is_prime(term)
	}

	terms.each {|term| checked.add term}

	if terms.length < 3
		next
	end

	terms.combination(3).each do |combo|
		
		# skip the example
		if (combo[0] == 1487)
			next
		end
		if combo[2] - combo[1] == combo[1] - combo[0]
			puts combo.join("")
			exit
		end
	end

end