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
require "../lib/primes"

$max_n = 10**7

$primes = Primes.new($max_n/11)

def φp(p1,p2)
  (p1-1)*(p2-1)
end

def is_permutation(x, y)
  x.to_s.split("").sort == y.to_s.split("").sort
end

if __FILE__ == $0

  limit = Math.sqrt($max_n)
  min_f = 10
  special_n = -1

  (0..$primes.primes.size-1).each {|i|
    # a little 'cheat' we need both primes to be near sqrt(max_n)
    if $primes.primes[i] < 1009
      next
    end
    if limit < $primes.primes[i]
      break
    end
    (i..$primes.primes.size-1).each{|j|
      product = $primes.primes[i] * $primes.primes[j]
      tot = φp($primes.primes[i],$primes.primes[j])
      f = product.to_f/tot.to_f
      if f < min_f
        if is_permutation(tot, product)
          puts "#{$primes.primes[i]};#{$primes.primes[j]}: #{product} #{tot} #{f}"
          min_f = f
          special_n = product
        end
      end

      if product > $max_n
        break
      end
    }
  }

end