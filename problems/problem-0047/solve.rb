#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# The first two consecutive numbers to have two distinct prime factors are:
# 
# 14 = 2 × 7
# 15 = 3 × 5
# 
# The first three consecutive numbers to have three distinct prime factors are:
# 
# 644 = 2² × 7 × 23
# 645 = 3 × 5 × 43
# 646 = 2 × 17 × 19.
# 
# Find the first four consecutive integers to have four distinct prime factors. What is the first of these numbers?
#
# ---------------------------------------------------------------------------------------------------------------------
require_relative "../lib/primes"
require_relative "../lib/incrementor"

require "logger"

$log = Logger.new STDOUT
$log.level = Logger::INFO
$log.datetime_format = '%Y-%m-%d %H:%M:%S%z '

primes = Primes.new(200000)

consecutive_ints = []

Incrementor.new(2).each do |i|
	factors = primes.prime_factors(i).uniq
	$log.debug "#{i}: [#{factors.join(',')}]"
	if factors.size == 4
		consecutive_ints.push i
	else
		consecutive_ints = []
	end
	if consecutive_ints.length == 4
		puts consecutive_ints[0]
		exit
	end
end