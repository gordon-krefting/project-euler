#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Digit factorial chains
# Problem 74
# The number 145 is well known for the property that the sum of the factorial of its digits is equal to 145:
# 
# 1! + 4! + 5! = 1 + 24 + 120 = 145
# 
# Perhaps less well known is 169, in that it produces the longest chain of numbers that link back to 169;
# it turns out that there are only three such loops that exist:
# 
# 169 → 363601 → 1454 → 169
# 871 → 45361 → 871
# 872 → 45362 → 872
# 
# It is not difficult to prove that EVERY starting number will eventually get stuck in a loop. For example,
# 
# 69 → 363600 → 1454 → 169 → 363601 (→ 1454)
# 78 → 45360 → 871 → 45361 (→ 871)
# 540 → 145 (→ 145)
# 
# Starting with 69 produces a chain of five non-repeating terms, but the longest non-repeating chain with a starting
# number below one million is sixty terms.
# 
# How many chains, with a starting number below one million, contain exactly sixty non-repeating terms?
#
# ---------------------------------------------------------------------------------------------------------------------
require "set"

$factorial_cache = (0..9).each_with_object({}) do |n, map|
  map[n] = n==0 ? 1 : n * map[n-1]
end

def factorial_sum(n)
  sum = 0
  while n != 0
    sum += $factorial_cache[n % 10]
    n = n / 10
  end
  return sum
end

if __FILE__ == $0
  
  chain_cache = {}

  puts (1..1000000).reduce(0) { |sum,n|
    chain = {}
    nxt = n
    length = 0
    while true
      if chain.include?(nxt)
        length = chain.length
        break
      end

      if chain_cache.has_key?(nxt)
        length = chain.length + chain_cache[nxt]
        break
      end

      chain[nxt] = 1
      
      if chain.size > 60
        puts "Ouch, something's not right!" # Problem states that this won't happen!
        break
      end
      
      nxt = factorial_sum(nxt)
    end

    chain_cache[n] = length

    if length == 60
      sum += 1
    end
    sum
  }

end

