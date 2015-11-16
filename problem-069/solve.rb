#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Totient maximum
# Problem 69
# Euler's Totient function, φ(n) [sometimes called the phi function], is used to determine the number of numbers less
# than n which are relatively prime to n. For example, as 1, 2, 4, 5, 7, and 8, are all less than nine and relatively
# prime to nine, φ(9)=6.
# 
# n   Relatively Prime   φ(n)   n/φ(n)
# 2    1                   1       2
# 3    1,2                 2       1.5
# 4    1,3                 2       2
# 5    1,2,3,4             4       1.25
# 6    1,5                 2       3
# 7    1,2,3,4,5,6         6       1.1666...
# 8    1,3,5,7             4       2
# 9    1,2,4,5,7,8         6       1.5
# 10   1,3,7,9             4       2.5
#
# It can be seen that n=6 produces a maximum n/φ(n) for n ≤ 10.
# 
# Find the value of n ≤ 1,000,000 for which n/φ(n) is a maximum.
#
# ---------------------------------------------------------------------------------------------------------------------
#
#    http://math.stackexchange.com/questions/317773/using-the-euler-totient-function-for-a-large-number
#    http://professorjava.weebly.com/totient.html
#
# ---------------------------------------------------------------------------------------------------------------------
#
# Turns out the answer here is:
#    510510 = 2 * 3 * 5 * 7 * 11 * 13 * 17 (product of the first 7 primes)
#
# Makes sense... we're looking for a large n with a low φ. 
#
# ---------------------------------------------------------------------------------------------------------------------

require "../lib/primes"

$primes = Primes.new(200000)

def φ(n)
  f = n
  $primes.prime_factors(n).uniq.each {|p|
    f = f - f/p
  }
  return f
end
if __FILE__ == $0

  max_f = 0.0
  max_n = 0

  (1..1000000).each {|n|
    f = n.to_f/(φ(n)).to_f
    if f > max_f
      max_f = f
      max_n = n
    end
  }
  puts max_n
end



