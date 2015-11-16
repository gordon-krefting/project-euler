#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase

  def test_comparable
    assert Fraction.new(1,2) > Fraction.new(1,3)
    assert Fraction.new(1,2) >= Fraction.new(2,4)
    assert Fraction.new(1,2) == Fraction.new(2,4)
    assert Fraction.new(1,4) <= Fraction.new(1,3)
    assert Fraction.new(1,4) <= Fraction.new(1,4)
    assert Fraction.new(1,4) < Fraction.new(1,3)
  end

end
