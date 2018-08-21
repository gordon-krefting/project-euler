#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Odd period square roots
# Problem 64
#
#  https://projecteuler.net/problem=64
#
# √2=[1;(2)], period=1
# √3=[1;(1,2)], period=2
# √5=[2;(4)], period=1
# √6=[2;(2,4)], period=2
# √7=[2;(1,1,1,4)], period=4
# √8=[2;(1,4)], period=2
# √10=[3;(6)], period=1
# √11=[3;(3,6)], period=2
# √12= [3;(2,6)], period=2
# √13=[3;(1,1,1,1,6)], period=5
# 
# Exactly four continued fractions, for N ≤ 13, have an odd period.
# 
# How many continued fractions for N ≤ 10000 have an odd period?
#
# ---------------------------------------------------------------------------------------------------------------------
#
# References:
#
#     https://en.wikipedia.org/wiki/Continued_fraction#Calculating_continued_fraction_representations
#     http://www.maths.surrey.ac.uk/hosted-sites/R.Knott/Fibonacci/cfINTRO.html#section7
#     https://en.wikipedia.org/wiki/Methods_of_computing_square_roots#Continued_fraction_expansion
#
require "set"

if __FILE__ == $0

  def frac(n, offset, denom, sequence, used_values)
    a = ((Math.sqrt(n) + offset.to_f) / denom.to_f).floor
    sequence.push(a)

    new_offset = (offset - a * denom) * -1
    new_denom = (n - new_offset ** 2) / denom

    key = "#{new_offset}|#{new_denom}"
    if used_values.include? key
      return
    end

    used_values.add key

    frac(n,new_offset,new_denom,sequence,used_values)
  end

  puts (2..10000).count {|n|
    if Math.sqrt(n).floor ** 2 == n
      next
    end

    sequence = []
    used_values = Set.new

    frac(n,0,1,sequence,used_values)

    period = sequence.length - 1

    #puts "√#{n}: #{sequence.inspect}, period=#{period}"

    period % 2 != 0
  }
end