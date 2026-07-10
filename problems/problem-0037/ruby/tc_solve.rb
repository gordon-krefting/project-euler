#!/usr/bin/env ruby

require_relative "solve"
require "test/unit"

class TestSolve < Test::Unit::TestCase
  def test_truncate_left
    assert_equal 797, truncate_left(3797)
  end

  def test_truncate_right
    assert_equal 379, truncate_right(3797)
  end

  # PrimeCache builds up its known-prime set incrementally, so it only behaves
  # correctly once every smaller n has already been checked in ascending
  # order (as the real solve loop does).
  def test_truncatable_prime
    (2..3797).each { |n| PRIMES.prime?(n) }

    assert truncatable_prime?(23)
    assert truncatable_prime?(3797)
    refute truncatable_prime?(41)
    refute truncatable_prime?(9)
  end
end
