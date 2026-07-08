#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase

  def test_fizz_buzz
    assert_equal 23, fizz_buzz(10)
    assert_equal 233168, fizz_buzz(1000)
  end

end
