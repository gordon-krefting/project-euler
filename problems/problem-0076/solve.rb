#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Counting summations
# Problem 76
# It is possible to write five as a sum in exactly six different ways:
# 
#  4 + 1
#  3 + 2
#  3 + 1 + 1
#  2 + 2 + 1
#  2 + 1 + 1 + 1
#  1 + 1 + 1 + 1 + 1
# 
# How many different ways can one hundred be written as a sum of at least two positive integers?
#
# ---------------------------------------------------------------------------------------------------------------------
# Did some brute force with a slow algorithm to discover the first 10 terms. Turns out this the "Partition Function":
#   https://en.wikipedia.org/wiki/Partition_(number_theory)#Partition_function
#
# So... from the article:
# This theorem can be used to derive a recurrence for the partition function:
#
#   p(k) = p(k − 1) + p(k − 2) − p(k − 5) − p(k − 7) + p(k − 12) + p(k − 15) − p(k − 22) − ...
#
# where p(0) is taken to equal 1, and p(k) is taken to be zero for negative k.
#
# OK. Those numbers in the series are the generalized pentagonal numbers. Yikes!
# Also, notice the wack almost alternating signs.
#
# Also, this problem is really asking for p(k)-1

if __FILE__ == $0

  $limit = 100
  $cache = {}

  $gp = (1..$limit).each_with_object([0]) {|n, terms|
    terms.push n * (3 * n - 1) / 2
    terms.push (-n) * (3 * (-n) - 1) / 2
  }

  def partition(k)
    if k == 0
      return 1
    end
    if k < 0
      return 0
    end

    if $cache.has_key? k
      return $cache[k]
    end

    # todo Rubify
    result = 0
    # Cheating a bit... 
    (1..$limit).each do |n|
      term = partition(k - $gp[n])
      sign = (n-1) / 2 % 2 == 0 ? 1 : -1
      result = result + term * sign
    end
    $cache[k] = result
    return result
  end

  puts partition(100) - 1

end
