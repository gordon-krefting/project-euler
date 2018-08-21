#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase

  def test_is_magic
    assert NGonRing.new([4,3,2,6,1,5]).is_magic
  end

  def test_is_not_magic
    assert !NGonRing.new([1,2,3,4,5,6]).is_magic
  end

end
