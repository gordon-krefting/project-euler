#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase
  def test_make_key
    assert_equal "12345", make_key(54321)
    assert_equal "1223", make_key(2321)
  end
end
