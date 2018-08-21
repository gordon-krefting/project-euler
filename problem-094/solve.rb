#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# It is easily proved that no equilateral triangle exists with integral length sides and integral area. However,
# the almost equilateral triangle 5-5-6 has an area of 12 square units.
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



def test(m,n,&block)
	if (m > 20000)
		return
	end

	yield(m,n)
	test(2*m - n, m, &block)
	test(2*m + n, m, &block)
	#if (n != 1)
	#test(m + 2*n, n, &block)
	#end
end

test(3,1) do |m,n|
	puts "#{m},#{n}"
	a = 2 * (m**2 - n**2)
	b = m**2 + n**2

	#puts a + b + b

	if (a + 1 == b || b + 1 == a)	
		puts " -> #{a}, #{b}, #{b}"
	end
end


