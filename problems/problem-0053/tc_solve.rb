#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestPrimes < Test::Unit::TestCase

  def test_factorial
    assert_equal 362880, 9.fact
  end

  def test_combo
    assert_equal 10, combo(5,3)
    assert_equal 1144066, combo(23,10)
    assert_equal 5498493658321124600506947888, combo(99,60)
  end

end