#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"
 
class TestSolve < Test::Unit::TestCase

  def test_is_palindrome
    assert 11.is_palindrome
    assert !12.is_palindrome
    assert 4668731596684224866951378664.is_palindrome
  end

  def test_next_iteration
    assert_equal 121, 47.next_iteration
    assert_equal 4213, 1292.next_iteration
  end

  def test_is_lychrel
    assert !47.is_lychrel
    assert !329.is_lychrel
    assert 196.is_lychrel
    assert 4994.is_lychrel
  end

end
