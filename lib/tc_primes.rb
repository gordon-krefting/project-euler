#!/usr/bin/env ruby

require_relative "primes"
require "test/unit"
 
class TestPrimes < Test::Unit::TestCase

	def setup
		@primes = Primes.new(100000)
	end

	def test_is_prime
		assert @primes.is_prime(17), "17 is prime"
		assert !@primes.is_prime(170), "170 is not prime"
	end

	def test_prime_factors
		assert_equal [2, 2, 3], @primes.prime_factors(12)
		assert_equal [3, 7, 7], @primes.prime_factors(147)
	end

	def test_prime_factors_of_prime
		assert_equal [17],      @primes.prime_factors(17)
	end
end