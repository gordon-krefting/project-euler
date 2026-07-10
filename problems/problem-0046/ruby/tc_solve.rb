#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase
  # prime?/conjecture? build up PRIMES incrementally, so they only behave
  # correctly once every smaller n has already been checked in ascending
  # order (as the real solve loop does).
  def test_conjecture_holds_for_known_examples
    (3..33).each { |n| prime?(n) }

    assert conjecture?(9)
    assert conjecture?(15)
    assert conjecture?(21)
    assert conjecture?(33)
  end

  def test_conjecture_fails_at_known_counterexample
    (3..5777).each { |n| prime?(n) }

    refute conjecture?(5777)
  end
end
