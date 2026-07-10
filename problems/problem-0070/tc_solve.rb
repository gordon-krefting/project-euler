#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase
  def test_totient_pair
    assert_equal 24, totient_pair(5, 7)
  end

  def test_permutation
    assert_true permutation?(123, 321)
    assert_false permutation?(123, 124)
  end
end
