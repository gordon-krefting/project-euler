#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase

  def test_factorial_sum
    assert_equal 145, factorial_sum(145)
    assert_equal 1454, factorial_sum(363601)
    assert_equal 1454, factorial_sum(363600)
    assert_equal 1454, factorial_sum(363600)
  end

end

