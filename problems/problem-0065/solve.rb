#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Convergents of e
# Problem 65
# The square root of 2 can be written as an infinite continued fraction. (Problem 57)
#  
# Hence the sequence of the first ten convergents for √2 are:
# 
# 1, 3/2, 7/5, 17/12, 41/29, 99/70, 239/169, 577/408, 1393/985, 3363/2378, ...
#
# What is most surprising is that the important mathematical constant,
#
# e = [2; 1,2,1, 1,4,1, 1,6,1 , ... , 1,2k,1, ...].
# 
# The first ten terms in the sequence of convergents for e are:
# 
# 2, 3, 8/3, 11/4, 19/7, 87/32, 106/39, 193/71, 1264/465, 1457/536, ...
#
# The sum of digits in the numerator of the 10th convergent is 1+4+5+7=17.
# 
# Find the sum of digits in the numerator of the 100th convergent of the continued fraction for e.
#
# ---------------------------------------------------------------------------------------------------------------------
#
#    https://en.wikipedia.org/wiki/Generalized_continued_fraction
#

if __FILE__ == $0
  a = [1] * 100
  b = [2]
  (1..40).each{|k|
    b.push 1
    b.push k*2
    b.push 1
  }

  A = [] # numerators
  B = [] # denominators
  (0..99).each {|n|
    if n==0
      A[0] = b[0]
      B[0] = 1
    elsif n==1
      A[1] = b[1] * b[0] + a[1]
      B[1] = b[1]
    else
      A[n] = b[n] * A[n-1] + a[n] * A[n-2]
      B[n] = b[n] * B[n-1] + a[n] * B[n-2]
    end

    #puts "#{n+1}: #{A[n]} / #{B[n]}"
  }

  puts A.last.to_s.split("").map{|c| c.to_i}.inject(:+)

end