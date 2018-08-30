#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase
  def test_gcd
    assert_equal 4, gcd(8, 12)
  end
  def test_totient
    assert_equal 4, φ(10)
    assert_equal 37632, φ(93296)
  end
end
