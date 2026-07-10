#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase
  def test_totient
    assert_equal 4, totient(10)
    assert_equal 37_632, totient(93_296)
  end
end
