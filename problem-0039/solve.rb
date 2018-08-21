#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# If p is the perimeter of a right angle triangle with integral length sides, {a,b,c},
# there are exactly three solutions for p = 120.
# 
# {20,48,52}, {24,45,51}, {30,40,50}
# 
# For which value of p ≤ 1000, is the number of solutions maximised?
#
# ---------------------------------------------------------------------------------------------------------------------

require "logger"

$log = Logger.new STDOUT
$log.level = Logger::INFO
$log.datetime_format = '%Y-%m-%d %H:%M:%S%z '

p_limit = 1000

(3..p_limit).each do |p|
	$log.debug "--------"
	$log.debug "Perimeter: #{p}"
	a_limit = p / (2 + Math.sqrt(2))
	count = 0
	(1..a_limit).each do |a|
		b = (p**2.0 - 2.0*a*p) / (2.0*p - 2.0*a)
		if b % 1 != 0
			next
		end
		c = Math.sqrt(a**2.0 + b**2.0)
		if c % 1 == 0
			count += 1
			$log.debug("{#{a}, #{b.to_int}, #{c.to_int}}")
		end
	end
	if count > 0
		puts "Perimeter: #{p}; Solutions: #{count}"
	end
end
