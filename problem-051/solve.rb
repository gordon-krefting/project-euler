#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# By replacing the 1st digit of the 2-digit number *3, it turns out that six of the nine possible values:
#       13, 23, 43, 53, 73, and 83,
# are all prime.
# 
# By replacing the 3rd and 4th digits of 56**3 with the same digit, this 5-digit number is the first example having
# seven primes among the ten generated numbers, yielding the family: 56003, 56113, 56333, 56443, 56663, 56773, and
# 56993. Consequently 56003, being the first member of this family, is the smallest prime with this property.
# 
# Find the smallest prime which, by replacing part of the number (not necessarily adjacent digits) with the same
# digit, is part of an eight prime value family.
#
# ---------------------------------------------------------------------------------------------------------------------
require_relative "../lib/incrementor.rb"
require_relative "../lib/sieve.rb"
require "logger"

$log = Logger.new STDOUT
$log.level = Logger::DEBUG
$log.datetime_format = '%Y-%m-%d %H:%M:%S%z '

init_primes(100000)

Incrementor.new(10).each do |seed|
	str = seed.to_s
	if (str.include? '1')
		family = (0..9).map{|i| str.gsub('1', i.to_s) }
		#puts family.join ' '
		primes = family.select {|generated|
			generated[0] != '0' && is_prime(generated.to_i)
		}
		#puts primes.join ' '
		if primes.length >= 6
			puts "#{str}:#{primes.join ' '}"
		end
		if primes.length >= 8
			puts "Done! #{primes[0]}"
			break
		end
	end
	if seed > 999999
		break
	end
end
