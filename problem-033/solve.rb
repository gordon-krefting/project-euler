#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Digit cancelling fractions
# Problem 33
# The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify it may
# incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.
# 
# We shall consider fractions like, 30/50 = 3/5, to be trivial examples.
# 
# There are exactly four non-trivial examples of this type of fraction, less than one in value, and containing
# two digits in the numerator and denominator.
# 
# If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
#
# ---------------------------------------------------------------------------------------------------------------------


def check(c, n, d)
#	puts "---"
#	puts "(#{c})   #{n} / #{d}"
#	puts n.sub(c,'').to_f / d.sub(c,'').to_f
#	puts n.to_f / d.to_f

	if n.sub(c,'').to_f / d.sub(c,'').to_f == n.to_f / d.to_f
		puts "#{n}/#{d}"
	end
end


(11..99).each do |denom|
	(10..denom-1).each do |num|

		n = num.to_s
		d = denom.to_s

		if n.include? '0' or d.include? '0'
			next
		end

		if d.include? n[0]
			check(n[0], n, d)
		end

		if d.include? n[1]
			check(n[1], n, d)
		end


		
	end
end




