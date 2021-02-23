#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# It is easily proved that no equilateral triangle exists with integral length sides and integral area. However,
# the almost eIsosceles Heronian trianglesquilateral triangle 5-5-6 has an area of 12 square units.
# 
# We shall define an almost equilateral triangle to be a triangle for which two sides are equal and the third differs
# by no more than one unit.
# 
# Find the sum of the perimeters of all almost equilateral triangles with integral side lengths and area and whose
# perimeters do not exceed one billion (1,000,000,000).
#
# ---------------------------------------------------------------------------------------------------------------------
# 
# Links to look at:
#   https://en.wikipedia.org/wiki/Integer_triangle#Isosceles_Heronian_triangles
#   https://en.wikipedia.org/wiki/Coprime_integers#Generating_all_coprime_pairs
#   http://forum.projecteuler.net/viewtopic.php?f=16&t=928
require_relative "../lib/incrementor.rb"
require "logger"

$log = Logger.new STDOUT
$log.level = Logger::DEBUG
$log.datetime_format = '%Y-%m-%d %H:%M:%S%z '

limit = 1000000000

# All the triangles we want are "Isosceles Heronian triangles"
def is_heronian(a, b, c)
	#$log.debug("Checking #{a}, #{b}, #{c}")
	return false
end


Incrementor.new(3).each do |a|
	b = a - 1
	c = a - 1

	if is_heronian(a,b,c)
		puts "h"
	end

	perimeter = a + b + c

	if perimeter % 1000000 == 0
		$log.debug perimeter
	end

	if (perimeter > limit)
		break
	end
	
	b = a + 1
	c = a + 1
	if is_heronian(a,b,c)
		puts "h"
	end

end
