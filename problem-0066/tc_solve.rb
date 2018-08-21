#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase
  def test_sq_root_expander
    expander = Square_Root_Expander.new(7)
    assert_equal 2, expander.get_b(0)
    assert_equal 1, expander.get_b(1)
    assert_equal 1, expander.get_b(2)
    assert_equal 1, expander.get_b(3)
    assert_equal 4, expander.get_b(4)
    assert_equal 1, expander.get_b(5)
    assert_equal 1, expander.get_b(6)
    assert_equal 1, expander.get_b(7)
    assert_equal 4, expander.get_b(8)
    assert_equal 1, expander.get_b(9)

  end
end
