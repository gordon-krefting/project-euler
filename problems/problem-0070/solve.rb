#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Totient permutation
# Problem 70
#
# Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine the number of positive
# numbers less than or equal to n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less
# than nine and relatively prime to nine, φ(9)=6.
#
# The number 1 is considered to be relatively prime to every positive number, so φ(1)=1.
#
# Interestingly, φ(87109)=79180, and it can be seen that 87109 is a permutation of 79180.
#
# Find the value of n, 1 < n < 10^7, for which φ(n) is a permutation of n and the ratio n/φ(n) produces a minimum.
#
# ---------------------------------------------------------------------------------------------------------------------
#
# figured out that n needs to be the product of 2 primes for n/φ(n) to be small
#
# There's a good shortcut to the totient function for the product of primes:
#      φ(p1 x p2) = (p1 - 1) x (p2 - 1)
#
#
require_relative "../../shared/ruby/primes"

def totient_pair(prime1, prime2)
  (prime1 - 1) * (prime2 - 1)
end

def permutation?(val1, val2)
  val1.to_s.chars.sort == val2.to_s.chars.sort
end

if __FILE__ == $PROGRAM_NAME
  max_n = 10**7
  primes = Primes.new(max_n / 11)
  limit = Math.sqrt(max_n)
  min_f = 10
  special_n = -1

  (0..(primes.primes.size - 1)).each do |i|
    # a little 'cheat' we need both primes to be near sqrt(max_n)
    next if primes.primes[i] < 1009
    break if limit < primes.primes[i]

    (i..(primes.primes.size - 1)).each do |j|
      product = primes.primes[i] * primes.primes[j]
      tot = totient_pair(primes.primes[i], primes.primes[j])
      f = product.to_f / tot
      if (f < min_f) && permutation?(tot, product)
        min_f = f
        special_n = product
      end

      break if product > max_n
    end
  end

  puts special_n
end
