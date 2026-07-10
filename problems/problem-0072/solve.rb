#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Counting fractions
# Problem 72
#
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced proper
# fraction.
#
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
#
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
#
# It can be seen that there are 21 elements in this set.
#
# How many elements would be contained in the set of reduced proper fractions for d ≤ 1,000,000?
#
# ---------------------------------------------------------------------------------------------------------------------
#
# This is the Farey sequence:
#   https://en.wikipedia.org/wiki/Farey_sequence
#
# There's a section in there on computing the length
#
require_relative "../../shared/ruby/primes"

PRIMES = Primes.new(200_000)

def totient(num)
  f = num
  PRIMES.prime_factors(num).uniq.each do |p|
    f -= (f / p)
  end
  f
end

def length_of_farey_sequence(limit)
  (2..limit).reduce(0) do |sum, d|
    sum + totient(d)
  end
end

puts length_of_farey_sequence(1_000_000) if __FILE__ == $PROGRAM_NAME
