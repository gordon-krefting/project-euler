#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase
  def test_totient
    assert_equal 4, totient(10)
  end

  def test_length_of_farey_sequence
    assert_equal 21, length_of_farey_sequence(8)
  end
end
