#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Starting with 1 and spiralling anticlockwise in the following way, a square spiral with side length 7 is formed.
# 
#      37 36 35 34 33 32 31
#      38 17 16 15 14 13 30
#      39 18  5  4  3 12 29
#      40 19  6  1  2 11 28
#      41 20  7  8  9 10 27
#      42 21 22 23 24 25 26
#      43 44 45 46 47 48 49
# 
# It is interesting to note that the odd squares lie along the bottom right diagonal, but what is more interesting is
# that 8 out of the 13 numbers lying along both diagonals are prime; that is, a ratio of 8/13 ≈ 62%.
# 
# If one complete new layer is wrapped around the spiral above, a square spiral with side length 9 will be formed.
# If this process is continued, what is the side length of the square spiral for which the ratio of primes along both
# diagonals first falls below 10%?
#
# ---------------------------------------------------------------------------------------------------------------------

require_relative "../lib/primes"
require_relative "../lib/incrementor"

primes = Primes.new(1000000)

corner_count = 1
prime_corner_count = 0

last_layer_max = 1

Incrementor.new(3,2).each {|n|

  corners = [
    last_layer_max + n - 1,
    last_layer_max + 2*(n - 1),
    last_layer_max + 3*(n - 1),
    last_layer_max + 4*(n - 1)
  ]

  corner_count += 4

  prime_corner_count += corners.select {|c| primes.is_prime(c)}.count

  ratio = prime_corner_count.to_f * 100 / corner_count.to_f

  if ratio < 10
    puts "#{n}: #{corners.inspect}"
    puts ratio
    break
  end
  
  last_layer_max = corners[3]
}


