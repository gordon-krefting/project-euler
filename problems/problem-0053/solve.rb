#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# There are exactly ten ways of selecting three from five, 12345:
# 
# 123, 124, 125, 134, 135, 145, 234, 235, 245, and 345
# 
# In combinatorics, we use the notation, 5C3 = 10.
# 
# In general,
# 
#      nCr = n! / r!(n−r)!
#
# where r ≤ n, n! = n×(n−1)×...×3×2×1, and 0! = 1.
# 
# It is not until n = 23, that a value exceeds one-million: 23C10 = 1144066.
# 
# How many, not necessarily distinct, values of  nCr, for 1 ≤ n ≤ 100, are greater than one-million?
#
# ---------------------------------------------------------------------------------------------------------------------
#

# making $fact_map global is lame... 
class Integer
  def fact
    if $fact_map.nil?
      $fact_map = Hash.new
    end

    if $fact_map.has_key? self
      return $fact_map[self]
    else
      val = (1..self).reduce(:*) || 1
      $fact_map[self] = val
      return val
    end
  end
end

def combo(n, r)
  return n.fact / (r.fact * (n-r).fact)
end

if __FILE__ == $0

  limit = 100

  count = 0

  # I'll bet there's some better way to track the count...
  (2..limit).each { |n|
    (1..n).each { |r|
      c = combo(n,r)
      if c > 1_000_000
        #puts "#{n}C#{r}:#{c} *"
        count += 1
      else
        #puts "#{n}C#{r}:#{c}"
      end
    }
  }
  puts count

end