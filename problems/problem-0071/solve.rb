#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Ordered fractions
# Problem 71
#
# Consider the fraction, n/d, where n and d are positive integers. If n<d and HCF(n,d)=1, it is called a reduced
# proper fraction.
#
# If we list the set of reduced proper fractions for d ≤ 8 in ascending order of size, we get:
#
# 1/8, 1/7, 1/6, 1/5, 1/4, 2/7, 1/3, 3/8, 2/5, 3/7, 1/2, 4/7, 3/5, 5/8, 2/3, 5/7, 3/4, 4/5, 5/6, 6/7, 7/8
#
# It can be seen that 2/5 is the fraction immediately to the left of 3/7.
#
# By listing the set of reduced proper fractions for d ≤ 1,000,000 in ascending order of size, find the numerator of
# the fraction immediately to the left of 3/7.
#
# ---------------------------------------------------------------------------------------------------------------------

class Fraction
  include Comparable

  attr_reader :numerator, :denominator

  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end

  def next_fraction
    Fraction.new(@numerator + 1, @denominator)
  end

  def <=>(other)
    (@numerator * other.denominator) <=> (other.numerator * @denominator)
  end

  def to_s
    "#{@numerator} / #{@denominator}"
  end
end

if __FILE__ == $PROGRAM_NAME

  target = Fraction.new(3, 7)
  best_match = Fraction.new(3, 8) # not really... but it'll be OK!

  (9..1_000_000).each do |d|
    guess = Fraction.new(best_match.numerator, d)
    loop do
      next_guess = guess.next_fraction
      break if next_guess >= target

      guess = next_guess
    end
    best_match = guess if guess > best_match
  end
  puts best_match.numerator

end
