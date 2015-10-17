#!/usr/bin/env ruby
#
# Pandigital multiples
# Problem 38
#
# Take the number 192 and multiply it by each of 1, 2, and 3:
#
#    192 × 1 = 192
#    192 × 2 = 384
#    192 × 3 = 576
#
# By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the
# concatenated product of 192 and (1,2,3)
#
# The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital,
# 918273645, which is the concatenated product of 9 and (1,2,3,4,5).
#
# What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated
# product of an integer with (1,2, ... , n) where n > 1?
# ---------------------------------------------------------------------------------------------------
#

# Put in a lib? How does that work?
def incrementor(i = 1)
	while true
		yield i
		i += 1
	end
end

def is_nine_digit_pandigital(n)
	# len = 9 && sum digits = 45
	s = n.to_s
	if s.length != 9
		return false
	end
	found_all = true
	(1..9).each do |c|
		found_all = found_all && (s.include? c.to_s)
	end
	return found_all
end

incrementor do |n|
	concat = ""
	incrementor do |i|
		concat += (n * i).to_s
		if ((concat.length == 9) && is_nine_digit_pandigital(concat))
			puts "#{n}: 1..#{i}: #{concat}"
		end
		if (concat.length > 9 && i == 2)
			exit
		end
		if (concat.length > 9)
			break
		end
	end
end