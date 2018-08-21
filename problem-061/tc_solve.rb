#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase
  def test_match
    assert match(2345, 4522)
    assert match(2345, 4500)
    assert match(2345, 4599)
    assert !match(2345, 2522)
  end
end
