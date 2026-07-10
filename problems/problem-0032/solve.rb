#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Pandigital Products
# Problem 32
#
# We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
# for example, the 5-digit number, 15234, is 1 through 5 pandigital.
#
# The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier,
# and product is 1 through 9 pandigital.
#
# Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.
#
# HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
# ---------------------------------------------------------------------------------------------------------------------
#
# Some optimizations:
#  we don't need to even check x * y AND y * x
#  faster is_pandigital function (not using strings?)
#
require_relative "../../shared/ruby/incrementor"

class Result
  def initialize(multiplicand, multiplier)
    @multiplicand = multiplicand
    @multiplier = multiplier
    @product = @multiplicand * @multiplier
    @identity = @multiplicand.to_s + @multiplier.to_s + @product.to_s
    @size = 9 # why here? something I don't get about Ruby scope
  end

  def is_out_of_range
    @identity.length > @size
  end

  def is_pandigital
    return false if @identity.length != @size

    found_all = true
    (1..@size).each do |c|
      found_all &&= (@identity.include? c.to_s)
    end
    found_all
  end

  attr_reader :product

  def to_s
    "#{@multiplicand} × #{@multiplier} = #{@product}; Pandigital:#{is_pandigital} Out of Range: #{is_out_of_range}"
  end
end

indentities = Set.new

Incrementor.new(1).each do |multiplicand|
  # creates an extra of these... boo
  break if Result.new(multiplicand, 1).is_out_of_range

  Incrementor.new(1).each do |multiplier|
    r = Result.new(multiplicand, multiplier)
    break if r.is_out_of_range

    if r.is_pandigital
      puts r
      indentities.add r.product
    end
  end
end

puts indentities.reduce(:+)
