#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Digit cancelling fractions
# Problem 33
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may
# incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
#
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
#
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing
# two digits in the numerator and denominator.
#
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
#
# ---------------------------------------------------------------------------------------------------------------------

def curious?(num, denom)
  n = num.to_s
  d = denom.to_s

  return false if n.end_with?("0") || d.end_with?("0")

  (n.chars & d.chars).any? do |c|
    reduced_num = n.sub(c, "")
    reduced_denom = d.sub(c, "")

    reduced_denom.to_i != 0 && Rational(reduced_num.to_i, reduced_denom.to_i) == Rational(num, denom)
  end
end

fractions = []

(11..99).each do |denom|
  (10...denom).each do |num|
    next unless curious?(num, denom)

    puts "#{num}/#{denom}"
    fractions << Rational(num, denom)
  end
end

product = fractions.reduce(:*)

puts "Result:#{product.denominator}"
