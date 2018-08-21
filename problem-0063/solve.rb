#!/usr/bin/env ruby
# ---------------------------------------------------------------------------------------------------------------------
# Powerful digit counts
# Problem 63
#
# The 5-digit number, 16807=7^5, is also a fifth power. Similarly, the 9-digit number, 134217728=8^9, is a ninth power.
# 
# How many n-digit positive integers exist which are also an nth power?
#
# ---------------------------------------------------------------------------------------------------------------------

require_relative "../lib/incrementor"

if __FILE__ == $0


  (1..100).count {|p|
    ulimit = 10 ** p
    llimit = 10 ** (p-1)
    Incrementor.new(1).each {|n|
      x = n ** p
      if x >= ulimit
        break
      end
      if x >= llimit
        puts "#{x}    #{n}^#{p}"
      end
    }
  }

end